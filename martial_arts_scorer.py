import streamlit as st
import cv2
import mediapipe as mp
import numpy as np
from scipy.spatial.distance import euclidean
from dtw import dtw 
import tempfile
import time
import os

# Khởi tạo MediaPipe Pose
mp_pose = mp.solutions.pose
mp_drawing = mp.solutions.drawing_utils

# Hằng số và Cấu hình
DEFAULT_SCORE = 100
# Hệ số điều chỉnh.
SCORE_SCALING_FACTOR = 10.0 
MIN_BODY_PARTS_FOR_CHECK = 10 # Số lượng khớp tối thiểu cần có để so sánh

# Định nghĩa mức điểm tối đa cho từng nhóm tiêu chí (Tổng = 100)
MAX_SCORE_KT = 40 # Kỹ thuật 
MAX_SCORE_BD = 40 # Biểu diễn
MAX_SCORE_TT = 20 # Trang phục/Thần thái
PENALTY_PER_MISTAKE = 1.0 # Trừ 1 điểm cho mỗi lỗi nặng (simulated)

st.set_page_config(layout="centered", page_title="Hệ Thống Chấm Điểm Bài Võ AI")

def normalize_pose_data(landmarks):
    """
    Chuẩn hóa dữ liệu tọa độ khớp (landmarks) để loại bỏ yếu tố vị trí và kích thước.
    1. Chuẩn hóa vị trí (đặt khớp hông/giữa cơ thể về (0,0)).
    2. Chuẩn hóa kích thước (chia cho chiều dài thân người).
    """
    if not landmarks:
        return None

    # Lấy tọa độ khớp hông (ví dụ: LEFT_HIP, RIGHT_HIP) để làm tâm
    try:
        left_hip = np.array([landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].x,
                             landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].y])
        right_hip = np.array([landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].x,
                              landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].y])
        
        # Tâm cơ thể là điểm giữa hai hông
        center = (left_hip + right_hip) / 2
        
        # Chiều dài cơ thể (ví dụ: khoảng cách giữa vai và hông) để chuẩn hóa kích thước
        left_shoulder = np.array([landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value].x,
                                  landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value].y])
        
        # Sử dụng khoảng cách vai-hông làm yếu tố tỷ lệ (scale factor)
        scale_factor = euclidean(left_hip, left_shoulder) * 2 
        
        if scale_factor < 1e-6: # Tránh chia cho 0
            scale_factor = 1.0
            
    except Exception:
        # Nếu không đủ khớp hông/vai, không thể chuẩn hóa
        return None

    normalized_data = []
    # Trích xuất 33 khớp, mỗi khớp 2 tọa độ (x, y) = 66 giá trị
    for landmark in landmarks:
        # Chuẩn hóa: (tọa độ - tâm) / yếu tố tỷ lệ
        normalized_x = (landmark.x - center[0]) / scale_factor
        normalized_y = (landmark.y - center[1]) / scale_factor
        
        normalized_data.append(normalized_x)
        normalized_data.append(normalized_y)
        
    return np.array(normalized_data)


# Đã loại bỏ @st.cache_data để thanh tiến trình hoạt động theo thời gian thực
def process_video(uploaded_file, name, progress_placeholder, progress_start, progress_end):
    """
    Xử lý video, trích xuất tọa độ khớp và chuẩn hóa, có cập nhật thanh tiến trình.
    """
    all_normalized_poses = []
    temp_file_path = None

    try:
        # Lưu file đã upload vào thư mục tạm thời
        with tempfile.NamedTemporaryFile(delete=False, suffix=f"_{name}.mp4") as tfile: 
            tfile.write(uploaded_file.read())
            temp_file_path = tfile.name
        
        cap = cv2.VideoCapture(temp_file_path)
        total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        if total_frames == 0:
            raise ValueError("Không thể đọc được video hoặc video trống.")
        
        with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.5) as pose:
            frame_count = 0
            while cap.isOpened():
                ret, frame = cap.read()
                if not ret:
                    break
                
                # Chuyển đổi sang RGB và xử lý
                image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                image.flags.writeable = False
                results = pose.process(image)
                image.flags.writeable = True

                # Trích xuất và chuẩn hóa dữ liệu tư thế
                if results.pose_landmarks:
                    landmarks = results.pose_landmarks.landmark
                    normalized_pose = normalize_pose_data(landmarks)
                    
                    # Chỉ lưu nếu chuẩn hóa thành công và có đủ số lượng khớp
                    if normalized_pose is not None and len(normalized_pose) >= MIN_BODY_PARTS_FOR_CHECK * 2:
                        all_normalized_poses.append(normalized_pose)

                frame_count += 1
                
                # Cập nhật thanh tiến trình: 
                # (Phần trăm ban đầu) + (Phạm vi xử lý) * (Tỷ lệ khung hình đã xử lý)
                current_progress = progress_start + (progress_end - progress_start) * (frame_count / total_frames)
                progress_placeholder.progress(int(current_progress))


    except Exception as e:
        st.error(f"Lỗi khi xử lý video {name}: {e}")
        return np.array([])
    finally:
        # Đảm bảo giải phóng cap và xóa file tạm
        if 'cap' in locals():
            cap.release()
        if temp_file_path and os.path.exists(temp_file_path):
            os.remove(temp_file_path)

    if not all_normalized_poses:
        st.error(f"Không thể phát hiện đủ tư thế trong video {name}. Vui lòng kiểm tra chất lượng video.")
        return np.array([])
        
    return np.array(all_normalized_poses)

def calculate_score(std_poses, student_poses):
    """
    So sánh hai chuỗi tư thế đã chuẩn hóa và tính điểm bằng Dynamic Time Warping (DTW).
    """
    
    len_std = std_poses.shape[0]
    len_student = student_poses.shape[0]

    if len_std == 0 or len_student == 0:
        return 0.0, 0.0
    
    try:
        # 1. Thực hiện DTW
        alignment = dtw(std_poses, student_poses, dist_method=euclidean)

        # 2. Lấy Sai Lệch DTW và Chuẩn hóa thủ công (Manual Normalization)
        total_dtw_distance = alignment.distance
        
        # Chuẩn hóa bằng cách chia cho độ dài của chuỗi chuẩn
        avg_dtw_error = total_dtw_distance / len_std
        
    except Exception as e:
        # Gỡ bỏ thông báo lỗi trong quá trình chạy, chỉ giữ lại thông báo lỗi lớn
        raise Exception(f"Lỗi DTW: {e}")


    # 3. Chuyển đổi Sai Lệch thành Điểm
    raw_score = DEFAULT_SCORE - (avg_dtw_error * SCORE_SCALING_FACTOR)
    final_score = np.clip(raw_score, 0, DEFAULT_SCORE)

    return final_score, avg_dtw_error

def generate_breakdown_table(final_score, avg_dtw_error):
    """
    Tạo bảng phân tích chi tiết điểm số dựa trên tổng điểm cuối cùng và sai lệch DTW.
    Phân bổ điểm sai lệch theo tỷ lệ đã định (KT: 40%, BD: 40%, TT: 20%).
    """
    
    # Số điểm bị trừ so với điểm tuyệt đối 100
    total_deduction = DEFAULT_SCORE - final_score
    
    # --- Mô phỏng trừ điểm theo từng nhóm tiêu chí (KT, BD, TT) ---
    
    # 1. Kỹ thuật (KT): Chiếm 40% điểm trừ
    deduction_kt = total_deduction * 0.4
    score_kt = np.clip(MAX_SCORE_KT - deduction_kt, 0, MAX_SCORE_KT)
    
    # 2. Biểu diễn (BD): Chiếm 40% điểm trừ
    deduction_bd = total_deduction * 0.4
    score_bd = np.clip(MAX_SCORE_BD - deduction_bd, 0, MAX_SCORE_BD)

    # 3. Trang phục/Thần thái (TT): Chiếm 20% điểm trừ (Giả định)
    deduction_tt = total_deduction * 0.2
    score_tt = np.clip(MAX_SCORE_TT - deduction_tt, 0, MAX_SCORE_TT)

    # Tổng điểm mô phỏng (Phải bằng Final Score)
    simulated_total_score = score_kt + score_bd + score_tt
    
    # --- Chuẩn bị dữ liệu cho bảng ---
    data = [
        ("Kỹ thuật (KT)", MAX_SCORE_KT, f"{score_kt:.2f}", f"Bị trừ: {deduction_kt:.2f}"),
        ("Biểu diễn (BD)", MAX_SCORE_BD, f"{score_bd:.2f}", f"Bị trừ: {deduction_bd:.2f}"),
        ("Trang phục/Thần thái (TT)", MAX_SCORE_TT, f"{score_tt:.2f}", f"Bị trừ: {deduction_tt:.2f}"),
        ("TỔNG CỘNG", DEFAULT_SCORE, f"{simulated_total_score:.2f}", f"Tổng sai lệch: {total_deduction:.2f}")
    ]

    # --- Tạo bảng Markdown ---
    table = "| Tiêu chí | Max Điểm | Điểm Đạt Được | Ghi chú (Mô phỏng) |\n"
    table += "| :--- | :---: | :---: | :--- |\n"
    for row in data:
        table += f"| **{row[0]}** | **{row[1]}** | **{row[2]}** | {row[3]} |\n"
        
    # Thêm chi tiết các tiêu chí con (Chỉ là mô tả, không tính điểm riêng)
    details = f"""
    ### 📝 Chi tiết Tiêu chí (Mức điểm đã được phân bổ)
    | Tiêu chí | Mô tả | 
    | :--- | :--- |
    | **KT1-KT4** | Chuẩn xác tấn pháp, thủ pháp, cước pháp; thăng bằng và kỹ pháp khó. |
    | **BD1-BD5** | Sức mạnh, sức bền, biên độ, tiết tấu và điểm dừng kỹ thuật. |
    | **TT1-TT4** | Trang phục, biểu cảm, thần thái, nhãn pháp, tiếng hát/phát lực. |
    """
    
    # Thêm phần trừ điểm nặng (simulated)
    penalty_placeholder = f"""
    ### ⚠️ Các trường hợp Bị Trừ Điểm Nghiêm Trọng
    *Lưu ý: Ứng dụng AI hiện tại không phát hiện được các lỗi sau, nhưng mô phỏng trừ **{PENALTY_PER_MISTAKE} điểm** mỗi lỗi.*
    1. Bị trượt ngã / Không thuộc bài / Rơi binh khí. (Giả định Võ sinh mắc **0** lỗi).
    """

    return table, details, penalty_placeholder


# --- Giao Diện Streamlit ---
st.markdown("""
    <style>
    .big-font {
        font-size:30px !important;
        font-weight: bold;
        color: #007bff;
        text-align: center;
        margin-bottom: 20px;
    }
    .main-score {
        font-size: 72px !important;
        font-weight: 900;
        color: #28a745;
        text-align: center;
        padding: 20px;
        border: 4px solid #28a745;
        border-radius: 15px;
        margin-top: 30px;
    }
    .stFileUploader {
        margin-bottom: 20px;
    }
    </style>
""", unsafe_allow_html=True)

st.markdown('<p class="big-font">🥋 Hệ Thống Chấm Điểm Bài Võ AI 🥋</p>', unsafe_allow_html=True)

# Khai báo Placeholder cho kết quả và tiến trình (Mục tiêu: Đưa kết quả lên đầu)
result_container = st.container()
progress_container = st.container()

st.write("Vui lòng tải lên video chuẩn (Kiện Tướng) và video của Võ Sinh để so sánh tư thế và chấm điểm.")

col1, col2 = st.columns(2)

with col1:
    standard_video_file = st.file_uploader(
        "Tải lên Video Chuẩn (Kiện Tướng)",
        type=['mp4', 'mov', 'avi'],
        key="standard_upload"
    )

with col2:
    student_video_file = st.file_uploader(
        "Tải lên Video Võ Sinh",
        type=['mp4', 'mov', 'avi'],
        key="student_upload"
    )

st.markdown("---")

if standard_video_file and student_video_file:
    
    if st.button("🚀 Bắt Đầu So Sánh Chấm Điểm"):
        
        # Thiết lập khu vực hiển thị tiến trình
        progress_bar = progress_container.progress(0)
        status_text = progress_container.empty()
        
        status_text.info("Bắt đầu xử lý...")
        
        # 1. Trích xuất Tư thế (Pose Estimation)
        try:
            start_time = time.time()
            
            # Xử lý Video Chuẩn (0% -> 50%)
            status_text.info("Đang xử lý Video Chuẩn (1/2)...")
            std_poses = process_video(standard_video_file, "Video Chuẩn", progress_bar, 0, 50)
            
            # Xử lý Video Võ Sinh (50% -> 100%)
            status_text.info("Đang xử lý Video Võ Sinh (2/2)...")
            student_poses = process_video(student_video_file, "Video Võ Sinh", progress_bar, 50, 95)
            
            progress_bar.progress(98)
            status_text.info("Hoàn thành trích xuất. Bắt đầu tính toán DTW...")


            if std_poses.shape[0] == 0 or student_poses.shape[0] == 0:
                result_container.error("Không đủ dữ liệu tư thế để so sánh. Vui lòng kiểm tra lại chất lượng video.")
            else:
                # 2. Tính toán Điểm số
                final_score, avg_error = calculate_score(std_poses, student_poses)
                
                # 3. Tạo bảng phân tích kết quả
                breakdown_table, details_markdown, penalty_markdown = generate_breakdown_table(final_score, avg_error)

                # Hiển thị kết quả (Sử dụng result_container để đưa lên trên)
                with result_container:
                    st.balloons()
                    st.markdown(f"""
                        <div class="main-score">
                            {final_score:.2f} / 100
                        </div>
                    """, unsafe_allow_html=True)
                    
                    st.success(f"✅ So sánh hoàn thành! Video Võ Sinh đạt **{final_score:.2f} / 100 điểm** so với video Chuẩn.")
                    
                    # Hiển thị bảng chi tiết
                    st.markdown("---")
                    st.markdown("## 📊 Bảng Thống Kê Kết Quả Chi Tiết")
                    st.markdown(breakdown_table)
                    st.markdown(details_markdown)
                    st.markdown(penalty_markdown)

                    st.markdown("---")
                    st.markdown("### 🔍 Phân tích Kỹ thuật Nền tảng")
                    st.write(f"- Phương pháp so sánh: **Dynamic Time Warping (DTW)**")
                    st.write(f"- Sai lệch DTW đã Chuẩn hóa theo độ dài chuẩn (Standard Length Normalized DTW Error): **{avg_error:.4f}**")
                    st.write(f"- Tổng thời gian xử lý: **{time.time() - start_time:.2f} giây**.")

        except Exception as e:
            result_container.error(f"Đã xảy ra lỗi nghiêm trọng: {e}")
            result_container.warning("Xin lưu ý: Ứng dụng này yêu cầu hiệu năng xử lý cao, nếu video quá dài hoặc chất lượng thấp có thể gây lỗi.")

        # Hoàn thành 100% và ẩn thanh tiến trình
        progress_bar.progress(100)
        status_text.empty()
        time.sleep(1)
        progress_container.empty() # Xóa khu vực tiến trình

elif standard_video_file or student_video_file:
    st.warning("Vui lòng tải lên cả hai video (Chuẩn và Võ Sinh) để bắt đầu so sánh.")
else:
    st.info("Chờ tải lên 2 video...")
