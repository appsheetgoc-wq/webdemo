<?php
// PHP Backend cho ứng dụng Quản lý Võ sinh
// Script này xử lý tất cả các hoạt động CRUD và trả về phản hồi JSON.

// Đặt tiêu đề để phản hồi JSON
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Tắt hiển thị lỗi PHP để không ảnh hưởng đến phản hồi JSON
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

// Hàm gửi phản hồi JSON và thoát script
function sendResponse($success, $message, $data = []) {
    echo json_encode(["success" => $success, "message" => $message, "data" => $data]);
    exit();
}

// Thông tin kết nối cơ sở dữ liệu
$servername = "localhost";
$username = "root"; // Mặc định của XAMPP
$password = ""; // Mặc định của XAMPP
$dbname = "phatquangquyen_db"; // Tên database bạn sẽ tạo

// Hàm tạo mã võ sinh duy nhất
function generateStudentCode($length = 8) {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $code = '';
    for ($i = 0; $i < $length; $i++) {
        $code .= $characters[random_int(0, strlen($characters) - 1)];
    }
    return 'PQQ' . $code;
}

// Hàm xử lý tải ảnh lên, trả về đường dẫn hoặc thông báo lỗi
function handleImageUpload($file_input_name) {
    if (isset($_FILES[$file_input_name]) && $_FILES[$file_input_name]['error'] === UPLOAD_ERR_OK) {
        $upload_dir = 'uploads/';
        
        if (!is_dir($upload_dir)) {
            if (!mkdir($upload_dir, 0777, true)) {
                return "ERROR: Không thể tạo thư mục tải lên. Vui lòng kiểm tra quyền.";
            }
        }
        
        if (!is_writable($upload_dir)) {
            return "ERROR: Thư mục tải lên không có quyền ghi.";
        }

        $file_tmp_path = $_FILES[$file_input_name]['tmp_name'];
        $file_name = $_FILES[$file_input_name]['name'];
        $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
        $unique_name = md5(time() . $file_name) . '.' . $file_ext;
        $dest_path = $upload_dir . $unique_name;

        if (move_uploaded_file($file_tmp_path, $dest_path)) {
            return $dest_path;
        } else {
            return "ERROR: Lỗi khi di chuyển tệp đã tải lên.";
        }
    }
    return null;
}

// Hàm chính để xử lý các yêu cầu
try {
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        throw new Exception("Kết nối CSDL thất bại: " . $conn->connect_error);
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['_action'])) {
        $action = $_POST['_action'];
        
        switch ($action) {
            case 'create':
                if (empty($_POST['name'])) {
                    sendResponse(false, "Vui lòng nhập Họ và Tên.");
                }
                do {
                    $studentCode = generateStudentCode();
                    $stmt_check = $conn->prepare("SELECT student_code FROM students WHERE student_code = ?");
                    $stmt_check->bind_param("s", $studentCode);
                    $stmt_check->execute();
                    $stmt_check->store_result();
                } while ($stmt_check->num_rows > 0);
                $stmt_check->close();

                $photoUniformPath = handleImageUpload('photoUniform');
                $photoFederationPath = handleImageUpload('photoFederation');
                $diplomaUniformPath = handleImageUpload('diplomaUniform');
                $diplomaFederationPath = handleImageUpload('diplomaFederation');
                $scorecardUniformPath = handleImageUpload('scorecardUniform');
                $scorecardFederationPath = handleImageUpload('scorecardFederation');
                
                if (strpos($photoUniformPath, 'ERROR') !== false || strpos($photoFederationPath, 'ERROR') !== false || strpos($diplomaUniformPath, 'ERROR') !== false || strpos($diplomaFederationPath, 'ERROR') !== false || strpos($scorecardUniformPath, 'ERROR') !== false || strpos($scorecardFederationPath, 'ERROR') !== false) {
                    if ($photoUniformPath && strpos($photoUniformPath, 'ERROR') === false) unlink($photoUniformPath);
                    if ($photoFederationPath && strpos($photoFederationPath, 'ERROR') === false) unlink($photoFederationPath);
                    if ($diplomaUniformPath && strpos($diplomaUniformPath, 'ERROR') === false) unlink($diplomaUniformPath);
                    if ($diplomaFederationPath && strpos($diplomaFederationPath, 'ERROR') === false) unlink($diplomaFederationPath);
                    if ($scorecardUniformPath && strpos($scorecardUniformPath, 'ERROR') === false) unlink($scorecardUniformPath);
                    if ($scorecardFederationPath && strpos($scorecardFederationPath, 'ERROR') === false) unlink($scorecardFederationPath);
                    sendResponse(false, "Lỗi khi tải ảnh. Vui lòng kiểm tra quyền ghi của thư mục uploads.");
                }

                $promotionTestUniform = isset($_POST['promotionTestUniform']) ? 1 : 0;
                $promotionTestFederation = isset($_POST['promotionTestFederation']) ? 1 : 0;

                $name = $_POST['name'];
                $dharmaName = $_POST['dharmaName'] ?? null;
                $gender = $_POST['gender'] ?? null;
                $dob = $_POST['dob'] ?? null;
                $idCard = $_POST['idCard'] ?? null;
                $pob = $_POST['pob'] ?? null;
                $address = $_POST['address'] ?? null;
                $belt = $_POST['belt'] ?? null;
                $federationBelt = $_POST['federationBelt'] ?? null;
                $club = $_POST['club'] ?? null;
                $status = $_POST['status'] ?? null;
                $phoneNumber = $_POST['phoneNumber'] ?? null;
                $coach = $_POST['coach'] ?? null;
                $educationLevel = $_POST['educationLevel'] ?? null;
                
                $sql = "INSERT INTO students (student_code, name, dharma_name, gender, dob, id_card, pob, address, photo_uniform, photo_federation, belt, federation_belt, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation, club, status, phone_number, coach, education_level, promotion_test_uniform, promotion_test_federation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("sssssssssssssssssssssii", $studentCode, $name, $dharmaName, $gender, $dob, $idCard, $pob, $address, $photoUniformPath, $photoFederationPath, $belt, $federationBelt, $diplomaUniformPath, $diplomaFederationPath, $scorecardUniformPath, $scorecardFederationPath, $club, $status, $phoneNumber, $coach, $educationLevel, $promotionTestUniform, $promotionTestFederation);
                
                if ($stmt->execute()) {
                    sendResponse(true, "Thêm võ sinh thành công.");
                } else {
                    sendResponse(false, "Lỗi khi thêm võ sinh: " . $stmt->error);
                }
                $stmt->close();
                break;

            case 'update':
                if (empty($_POST['name'])) {
                    sendResponse(false, "Vui lòng nhập Họ và Tên.");
                }
                $id = $_POST['id'];
                $studentCode = $_POST['studentCode'] ?? null;
                $name = $_POST['name'];
                $dharmaName = $_POST['dharmaName'] ?? null;
                $gender = $_POST['gender'] ?? null;
                $dob = $_POST['dob'] ?? null;
                $idCard = $_POST['idCard'] ?? null;
                $pob = $_POST['pob'] ?? null;
                $address = $_POST['address'] ?? null;
                $belt = $_POST['belt'] ?? null;
                $federationBelt = $_POST['federationBelt'] ?? null;
                $club = $_POST['club'] ?? null;
                $status = $_POST['status'] ?? null;
                $phoneNumber = $_POST['phoneNumber'] ?? null;
                $coach = $_POST['coach'] ?? null;
                $educationLevel = $_POST['educationLevel'] ?? null;
                $promotionTestUniform = isset($_POST['promotionTestUniform']) ? 1 : 0;
                $promotionTestFederation = isset($_POST['promotionTestFederation']) ? 1 : 0;

                $currentPaths = [];
                $sql_select = "SELECT photo_uniform, photo_federation, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation FROM students WHERE id = ?";
                $stmt_select = $conn->prepare($sql_select);
                $stmt_select->bind_param("i", $id);
                $stmt_select->execute();
                $result_select = $stmt_select->get_result();
                if ($row = $result_select->fetch_assoc()) {
                    $currentPaths = $row;
                }
                $stmt_select->close();

                $photoUniformPath = handleImageUpload('photoUniform') ?: $currentPaths['photo_uniform'];
                $photoFederationPath = handleImageUpload('photoFederation') ?: $currentPaths['photo_federation'];
                $diplomaUniformPath = handleImageUpload('diplomaUniform') ?: $currentPaths['diploma_uniform'];
                $diplomaFederationPath = handleImageUpload('diplomaFederation') ?: $currentPaths['diploma_federation'];
                $scorecardUniformPath = handleImageUpload('scorecardUniform') ?: $currentPaths['scorecard_uniform'];
                $scorecardFederationPath = handleImageUpload('scorecardFederation') ?: $currentPaths['scorecard_federation'];

                if (strpos($photoUniformPath, 'ERROR') !== false || strpos($photoFederationPath, 'ERROR') !== false || strpos($diplomaUniformPath, 'ERROR') !== false || strpos($diplomaFederationPath, 'ERROR') !== false || strpos($scorecardUniformPath, 'ERROR') !== false || strpos($scorecardFederationPath, 'ERROR') !== false) {
                    if ($photoUniformPath && strpos($photoUniformPath, 'ERROR') === false) unlink($photoUniformPath);
                    if ($photoFederationPath && strpos($photoFederationPath, 'ERROR') === false) unlink($photoFederationPath);
                    if ($diplomaUniformPath && strpos($diplomaUniformPath, 'ERROR') === false) unlink($diplomaUniformPath);
                    if ($diplomaFederationPath && strpos($diplomaFederationPath, 'ERROR') === false) unlink($diplomaFederationPath);
                    if ($scorecardUniformPath && strpos($scorecardUniformPath, 'ERROR') === false) unlink($scorecardUniformPath);
                    if ($scorecardFederationPath && strpos($scorecardFederationPath, 'ERROR') === false) unlink($scorecardFederationPath);
                    sendResponse(false, "Lỗi khi tải ảnh. Vui lòng kiểm tra quyền ghi của thư mục uploads.");
                }

                $sql = "UPDATE students SET student_code=?, name=?, dharma_name=?, gender=?, dob=?, id_card=?, pob=?, address=?, photo_uniform=?, photo_federation=?, belt=?, federation_belt=?, diploma_uniform=?, diploma_federation=?, scorecard_uniform=?, scorecard_federation=?, club=?, status=?, phone_number=?, coach=?, education_level=?, promotion_test_uniform=?, promotion_test_federation=? WHERE id=?";
                $stmt = $conn->prepare($sql);
                if (!$stmt) {
                    sendResponse(false, "Lỗi chuẩn bị câu lệnh SQL: " . $conn->error);
                }
                $stmt->bind_param("sssssssssssssssssssssiii", $studentCode, $name, $dharmaName, $gender, $dob, $idCard, $pob, $address, $photoUniformPath, $photoFederationPath, $belt, $federationBelt, $diplomaUniformPath, $diplomaFederationPath, $scorecardUniformPath, $scorecardFederationPath, $club, $status, $phoneNumber, $coach, $educationLevel, $promotionTestUniform, $promotionTestFederation, $id);

                if ($stmt->execute()) {
                    sendResponse(true, "Cập nhật võ sinh thành công.");
                } else {
                    sendResponse(false, "Lỗi khi cập nhật võ sinh: " . $stmt->error);
                }
                $stmt->close();
                break;

            case 'delete':
                if (!isset($_POST['id'])) {
                    sendResponse(false, "Không tìm thấy ID võ sinh để xóa.");
                }
                $id = $_POST['id'];

                $sql_select = "SELECT photo_uniform, photo_federation, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation FROM students WHERE id = ?";
                $stmt_select = $conn->prepare($sql_select);
                $stmt_select->bind_param("i", $id);
                $stmt_select->execute();
                $result_select = $stmt_select->get_result();
                if ($row = $result_select->fetch_assoc()) {
                    foreach ($row as $path) {
                        if ($path && file_exists($path)) {
                            unlink($path);
                        }
                    }
                }
                $stmt_select->close();

                $sql = "DELETE FROM students WHERE id=?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $id);

                if ($stmt->execute()) {
                    sendResponse(true, "Xóa võ sinh thành công.");
                } else {
                    sendResponse(false, "Lỗi khi xóa võ sinh: " . $stmt->error);
                }
                $stmt->close();
                break;

            case 'add_exercise':
                if (empty($_POST['name']) || empty($_POST['type'])) {
                    sendResponse(false, "Tên bài tập và loại là bắt buộc.");
                }
                $name = $_POST['name'];
                $belt = $_POST['belt'] ?? null; // Cập nhật để có thể là null
                $type = $_POST['type'];
                $guide_url = $_POST['guide_url'] ?? null;

                $sql = "INSERT INTO exercises (name, belt, type, guide_url) VALUES (?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ssss", $name, $belt, $type, $guide_url);

                if ($stmt->execute()) {
                    sendResponse(true, "Thêm bài tập thành công.");
                } else {
                    sendResponse(false, "Lỗi khi thêm bài tập: " . $stmt->error);
                }
                $stmt->close();
                break;

            case 'update_progress':
                if (empty($_POST['student_id']) || empty($_POST['exercise_id'])) {
                    sendResponse(false, "ID võ sinh và ID bài tập là bắt buộc.");
                }
                $student_id = $_POST['student_id'];
                $exercise_id = $_POST['exercise_id'];
                $is_completed = isset($_POST['is_completed']) ? 1 : 0;
                $completed_at = $is_completed ? date('Y-m-d H:i:s') : null;
                
                $sql_check = "SELECT id FROM student_exercises WHERE student_id = ? AND exercise_id = ?";
                $stmt_check = $conn->prepare($sql_check);
                $stmt_check->bind_param("ii", $student_id, $exercise_id);
                $stmt_check->execute();
                $result_check = $stmt_check->get_result();

                if ($result_check->num_rows > 0) {
                    $sql = "UPDATE student_exercises SET is_completed = ?, completed_at = ? WHERE student_id = ? AND exercise_id = ?";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("isii", $is_completed, $completed_at, $student_id, $exercise_id);
                } else {
                    $sql = "INSERT INTO student_exercises (student_id, exercise_id, is_completed, completed_at) VALUES (?, ?, ?, ?)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("iiis", $student_id, $exercise_id, $is_completed, $completed_at);
                }
                
                if ($stmt->execute()) {
                    sendResponse(true, "Cập nhật tiến độ thành công.");
                } else {
                    sendResponse(false, "Lỗi khi cập nhật tiến độ: " . $stmt->error);
                }
                $stmt->close();
                $stmt_check->close();
                break;
            
            case 'update_exercise':
                if (empty($_POST['id']) || empty($_POST['name']) || empty($_POST['type'])) {
                    sendResponse(false, "ID, tên bài tập và loại là bắt buộc.");
                }
                $id = $_POST['id'];
                $name = $_POST['name'];
                $belt = $_POST['belt'] ?? null; // Cập nhật để có thể là null
                $type = $_POST['type'];
                $guide_url = $_POST['guide_url'] ?? null;

                $sql = "UPDATE exercises SET name = ?, belt = ?, type = ?, guide_url = ? WHERE id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ssssi", $name, $belt, $type, $guide_url, $id);

                if ($stmt->execute()) {
                    sendResponse(true, "Cập nhật bài tập thành công.");
                } else {
                    sendResponse(false, "Lỗi khi cập nhật bài tập: " . $stmt->error);
                }
                $stmt->close();
                break;
                // Thêm action này vào phần switch($action) trong api.php
case 'update_all_progress':
    if (empty($_POST['student_id'])) {
        sendResponse(false, "ID võ sinh là bắt buộc.");
    }
    $student_id = $_POST['student_id'];
    $completed_exercises = json_decode($_POST['completed_exercises'], true);

    // Bắt đầu transaction để đảm bảo tính toàn vẹn dữ liệu
    $conn->begin_transaction();

    try {
        // Xóa tất cả các bản ghi tiến độ cũ của võ sinh
        $sql_delete = "DELETE FROM student_exercises WHERE student_id = ?";
        $stmt_delete = $conn->prepare($sql_delete);
        $stmt_delete->bind_param("i", $student_id);
        $stmt_delete->execute();
        $stmt_delete->close();

        // Thêm lại các bài tập đã hoàn thành
        if (!empty($completed_exercises)) {
            $sql_insert = "INSERT INTO student_exercises (student_id, exercise_id, is_completed, completed_at) VALUES (?, ?, 1, NOW())";
            $stmt_insert = $conn->prepare($sql_insert);

            foreach ($completed_exercises as $exercise_id) {
                $stmt_insert->bind_param("ii", $student_id, $exercise_id);
                $stmt_insert->execute();
            }
            $stmt_insert->close();
        }

        $conn->commit();
        sendResponse(true, "Cập nhật tiến độ thành công.");

    } catch (Exception $e) {
        $conn->rollback();
        sendResponse(false, "Lỗi khi cập nhật tiến độ: " . $e->getMessage());
    }
    break;
            case 'delete_exercise':
                if (empty($_POST['id'])) {
                    sendResponse(false, "Không tìm thấy ID bài tập để xóa.");
                }
                $id = $_POST['id'];
                $sql = "DELETE FROM exercises WHERE id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $id);

                if ($stmt->execute()) {
                    sendResponse(true, "Xóa bài tập thành công.");
                } else {
                    sendResponse(false, "Lỗi khi xóa bài tập: " . $stmt->error);
                }
                $stmt->close();
                break;

            default:
                sendResponse(false, "Hành động không hợp lệ.");
                break;
        }
    }

    if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['_action'])) {
        $action = $_GET['_action'];
        
        switch ($action) {
            case 'get_single_exercise':
    if (empty($_GET['id'])) {
        sendResponse(false, "ID bài tập là bắt buộc.");
    }
    $id = $_GET['id'];
    $sql = "SELECT * FROM exercises WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $exercise = $result->fetch_assoc();
        sendResponse(true, "Lấy thông tin bài tập thành công.", $exercise);
    } else {
        sendResponse(false, "Không tìm thấy bài tập.");
    }
    $stmt->close();
    break;
            case 'read':
                $where_clauses = [];
                $params = [];
                $types = '';
                
                if (!empty($_GET['club'])) {
                    $where_clauses[] = "club = ?";
                    $params[] = $_GET['club'];
                    $types .= 's';
                }
                if (!empty($_GET['belt'])) {
                    $where_clauses[] = "belt = ?";
                    $params[] = $_GET['belt'];
                    $types .= 's';
                }
                if (!empty($_GET['federationBelt'])) {
                    $where_clauses[] = "federation_belt = ?";
                    $params[] = $_GET['federationBelt'];
                    $types .= 's';
                }
                if (!empty($_GET['status'])) {
                    $where_clauses[] = "status = ?";
                    $params[] = $_GET['status'];
                    $types .= 's';
                }
                if (!empty($_GET['coach'])) {
                    $where_clauses[] = "coach = ?";
                    $params[] = $_GET['coach'];
                    $types .= 's';
                }
                if (!empty($_GET['gender'])) {
                    $where_clauses[] = "gender = ?";
                    $params[] = $_GET['gender'];
                    $types .= 's';
                }
                if (isset($_GET['promotionUniform']) && $_GET['promotionUniform'] == '1') {
                    $where_clauses[] = "promotion_test_uniform = 1";
                }
                if (isset($_GET['promotionFederation']) && $_GET['promotionFederation'] == '1') {
                    $where_clauses[] = "promotion_test_federation = 1";
                }

                $sql = "SELECT * FROM students";
                $sql_count = "SELECT COUNT(*) AS total_count FROM students";
                
                if (!empty($where_clauses)) {
                    $where_str = " WHERE " . implode(" AND ", $where_clauses);
                    $sql .= $where_str;
                    $sql_count .= $where_str;
                }
                $sql .= " ORDER BY name ASC";
                
                $stmt_count = $conn->prepare($sql_count);
                if (!$stmt_count) {
                     sendResponse(false, "Lỗi chuẩn bị câu lệnh SQL đếm: " . $conn->error);
                }
                if (!empty($params)) {
                    $stmt_count->bind_param($types, ...$params);
                }
                $stmt_count->execute();
                $result_count = $stmt_count->get_result();
                $total_count = $result_count->fetch_assoc()['total_count'];
                $stmt_count->close();
                
                $stmt = $conn->prepare($sql);
                if (!$stmt) {
                    sendResponse(false, "Lỗi chuẩn bị câu lệnh SQL: " . $conn->error);
                }
                if (!empty($params)) {
                    $stmt->bind_param($types, ...$params);
                }
                $stmt->execute();
                $result = $stmt->get_result();
                
                $students = [];
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        $students[] = $row;
                    }
                }
                
                $stmt->close();
                sendResponse(true, "Tải dữ liệu thành công.", ["students" => $students, "total_count" => $total_count]);
                break;

            case 'get_single':
                $id = $_GET['id'];
                $sql = "SELECT * FROM students WHERE id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $student = $result->fetch_assoc();
                    sendResponse(true, "Lấy thông tin võ sinh thành công.", $student);
                } else {
                    sendResponse(false, "Không tìm thấy võ sinh.");
                }
                $stmt->close();
                break;
            
            case 'get_filters':
                $filters = [
                    'club' => [],
                    'belt' => [],
                    'federationBelt' => [],
                    'status' => [],
                    'coach' => [],
                ];

                $sql = "SELECT DISTINCT club FROM students WHERE club IS NOT NULL AND club != '' ORDER BY club ASC";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $filters['club'][] = $row['club'];
                }
                
                $sql = "SELECT DISTINCT belt FROM students WHERE belt IS NOT NULL AND belt != '' ORDER BY belt ASC";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $filters['belt'][] = $row['belt'];
                }
                
                $sql = "SELECT DISTINCT federation_belt FROM students WHERE federation_belt IS NOT NULL AND federation_belt != '' ORDER BY federation_belt ASC";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $filters['federationBelt'][] = $row['federation_belt'];
                }

                $sql = "SELECT DISTINCT status FROM students WHERE status IS NOT NULL AND status != '' ORDER BY status ASC";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $filters['status'][] = $row['status'];
                }
                
                $sql = "SELECT DISTINCT coach FROM students WHERE coach IS NOT NULL AND coach != '' ORDER BY coach ASC";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $filters['coach'][] = $row['coach'];
                }

                sendResponse(true, "Lấy danh sách bộ lọc thành công.", $filters);
                break;

            case 'get_all_exercises':
                $sql = "SELECT * FROM exercises ORDER BY belt ASC, type ASC, name ASC";
                $result = $conn->query($sql);
                $exercises = [];
                while ($row = $result->fetch_assoc()) {
                    $exercises[] = $row;
                }
                sendResponse(true, "Lấy danh sách bài tập thành công.", $exercises);
                break;

            case 'get_exercises_by_type':
                $type = $_GET['type'] ?? null;
                $belt = $_GET['belt'] ?? null;
                if (!$type || !$belt) {
                    sendResponse(false, "Loại bài tập và cấp đai là bắt buộc.");
                }
                $sql = "SELECT * FROM exercises WHERE type = ? AND belt = ? ORDER BY name ASC";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ss", $type, $belt);
                $stmt->execute();
                $result = $stmt->get_result();
                $exercises = [];
                while($row = $result->fetch_assoc()) {
                    $exercises[] = $row;
                }
                $stmt->close();
                sendResponse(true, "Lấy danh sách bài tập thành công.", $exercises);
                break;

            case 'get_student_progress':
                if (empty($_GET['student_id'])) {
                    sendResponse(false, "ID võ sinh là bắt buộc.");
                }
                $student_id = $_GET['student_id'];
                $belt = $_GET['belt'] ?? null;

                if (empty($belt)) {
                    sendResponse(false, "Cấp đai là bắt buộc để lấy tiến độ bài tập.");
                }

                $sql = "SELECT e.id, e.name, e.belt, e.guide_url, e.type, se.is_completed FROM exercises e LEFT JOIN student_exercises se ON e.id = se.exercise_id AND se.student_id = ? WHERE e.belt = ? ORDER BY e.name";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("is", $student_id, $belt);
                $stmt->execute();
                $result = $stmt->get_result();
                $progress = [];
                while($row = $result->fetch_assoc()) {
                    $progress[] = $row;
                }
                $stmt->close();
                sendResponse(true, "Lấy tiến độ bài tập thành công.", $progress);
                break;
                
            default:
                sendResponse(false, "Hành động không hợp lệ.");
                break;
        }
    }
    
    // Nếu không có hành động nào được gọi, mặc định trả về lỗi
    sendResponse(false, "Hành động không hợp lệ.");


} catch (Exception $e) {
    sendResponse(false, "Đã xảy ra lỗi không mong muốn: " . $e->getMessage());
}

if (isset($conn) && $conn) {
    $conn->close();
}
?>