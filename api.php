<?php
// PHP Backend cho ứng dụng Quản lý Võ sinh
// Script này xử lý tất cả các hoạt động CRUD và trả về phản hồi JSON.
// Sử dụng PDO để kết nối cơ sở dữ liệu

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
// define('DB_SERVER', 'sql300.infinityfree.com');
// define('DB_USERNAME', 'if0_40011866');
// define('DB_PASSWORD', 'Jrq78TffMG1TJ');
// define('DB_NAME', 'if0_40011866_phatquangquyen_db');
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'phatquangquyen_db');

// Hàm tạo mã võ sinh duy nhất
function generateStudentCode($length = 8) {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $code = '';
    for ($i = 0; $i < $length; $i++) {
        $code .= $characters[random_int(0, strlen($characters) - 1)];
    }
    return 'PQQ' . $code;
}

// Hàm xử lý tải ảnh lên, trả về đường dẫn hoặc null
function handleImageUpload($file_input_name) {
    if (isset($_FILES[$file_input_name]) && $_FILES[$file_input_name]['error'] === UPLOAD_ERR_OK) {
        $upload_dir = 'uploads/';

        if (!is_dir($upload_dir)) {
            if (!mkdir($upload_dir, 0777, true)) {
                sendResponse(false, "ERROR: Không thể tạo thư mục tải lên. Vui lòng kiểm tra quyền.");
            }
        }

        if (!is_writable($upload_dir)) {
            sendResponse(false, "ERROR: Thư mục tải lên không có quyền ghi.");
        }

        $file_tmp_path = $_FILES[$file_input_name]['tmp_name'];
        $file_name = $_FILES[$file_input_name]['name'];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $unique_name = md5(time() . $file_name) . '.' . $file_ext;
        $dest_path = $upload_dir . $unique_name;

        if (move_uploaded_file($file_tmp_path, $dest_path)) {
            return $dest_path;
        } else {
            sendResponse(false, "ERROR: Lỗi khi di chuyển tệp đã tải lên.");
        }
    }
    return null;
}

// Hàm trích xuất file ID từ URL Google Drive và tạo URL trực tiếp
function extractGoogleDriveFileId($url) {
    // Kiểm tra nếu URL là định dạng rút gọn "uc?id=..."
    if (strpos($url, 'uc?id=') === 0) {
        return "https://drive.google.com/" . $url;
    }

    $fileId = null;
    $patterns = [
        '/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)/',
        '/drive\.google\.com\/uc\?id=([a-zA-Z0-9_-]+)/',
    ];

    foreach ($patterns as $pattern) {
        if (preg_match($pattern, $url, $matches)) {
            $fileId = $matches[1];
            break;
        }
    }

    if ($fileId) {
        return "https://drive.google.com/uc?id=" . $fileId;
    }

    return $url; // Trả về URL gốc nếu không tìm thấy ID
}

// Hàm chính để xử lý các yêu cầu
try {
    $pdo = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME, DB_USERNAME, DB_PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'utf8mb4'");

    $requestMethod = $_SERVER['REQUEST_METHOD'];
    $action = $_REQUEST['_action'] ?? '';

    switch ($requestMethod) {
        case 'POST':
            handlePostRequest($pdo, $action);
            break;
        case 'GET':
            handleGetRequest($pdo, $action);
            break;
        default:
            sendResponse(false, "Phương thức yêu cầu không được hỗ trợ.");
            break;
    }

} catch (Exception $e) {
    sendResponse(false, "Đã xảy ra lỗi không mong muốn: " . $e->getMessage());
}

// Hàm xử lý các yêu cầu POST
function handlePostRequest($pdo, $action) {
    switch ($action) {
        case 'create':
            if (empty($_POST['name'])) {
                sendResponse(false, "Vui lòng nhập Họ và Tên.");
            }
            do {
                $studentCode = generateStudentCode();
                $stmt_check = $pdo->prepare("SELECT student_code FROM students WHERE student_code = ?");
                $stmt_check->execute([$studentCode]);
            } while ($stmt_check->rowCount() > 0);

            $photoUniformPath = handleImageUpload('photoUniform');
            $photoFederationPath = handleImageUpload('photoFederation');
            $diplomaUniformPath = handleImageUpload('diplomaUniform');
            $diplomaFederationPath = handleImageUpload('diplomaFederation');
            $scorecardUniformPath = handleImageUpload('scorecardUniform');
            $scorecardFederationPath = handleImageUpload('scorecardFederation');

            $promotionTestUniform = isset($_POST['promotionTestUniform']) ? 1 : 0;
            $promotionTestFederation = isset($_POST['promotionTestFederation']) ? 1 : 0;
            $groupId = $_POST['groupId'] ?? null;
            $url = extractGoogleDriveFileId($_POST['url'] ?? null);

            $sql = "INSERT INTO students (student_code, name, dharma_name, gender, dob, id_card, pob, address, photo_uniform, photo_federation, belt, federation_belt, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation, club, status, phone_number, coach, group_id, education_level, promotion_test_uniform, promotion_test_federation, height_cm, weight_kg, url, registered_level) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([
                $studentCode, $_POST['name'], $_POST['dharmaName'] ?? null, $_POST['gender'] ?? null, $_POST['dob'] ?? null, $_POST['idCard'] ?? null, $_POST['pob'] ?? null, $_POST['address'] ?? null,
                $photoUniformPath, $photoFederationPath, $_POST['belt'] ?? null, $_POST['federationBelt'] ?? null, $diplomaUniformPath, $diplomaFederationPath, $scorecardUniformPath,
                $scorecardFederationPath, $_POST['club'] ?? null, $_POST['status'] ?? null, $_POST['phoneNumber'] ?? null, $_POST['coach'] ?? null, $groupId, $_POST['educationLevel'] ?? null,
                $promotionTestUniform, $promotionTestFederation, $_POST['height_cm'] ?? null, $_POST['weight_kg'] ?? null, $url, $_POST['registered_level'] ?? null
            ]);
            sendResponse($success, $success ? "Thêm võ sinh thành công." : "Lỗi khi thêm võ sinh.");
            break;
            // Thêm case mới vào hàm handlePostRequest
        case 'upload_diploma_template':
            if (!isset($_FILES['diploma_file'])) {
                sendResponse(false, "Không có file được tải lên.");
            }

            // Tạo thư mục để lưu ảnh nếu chưa có
            $targetDir = "uploads/";
            if (!is_dir($targetDir)) {
                mkdir($targetDir, 0777, true);
            }

            $fileName = basename($_FILES["diploma_file"]["name"]);
            $fileType = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
            $newFileName = uniqid('diploma_', true) . '.' . $fileType;
            $targetFilePath = $targetDir . $newFileName;

            // Kiểm tra định dạng ảnh
            if ($fileType != "jpg" && $fileType != "png" && $fileType != "jpeg") {
                sendResponse(false, "Chỉ chấp nhận file JPG, JPEG & PNG.");
            }

            if (move_uploaded_file($_FILES["diploma_file"]["tmp_name"], $targetFilePath)) {
                sendResponse(true, "Tải file thành công.", ["file_path" => $targetFilePath]);
            } else {
                sendResponse(false, "Lỗi khi di chuyển file đã tải lên.");
            }
            break;
        case 'update':
            if (empty($_POST['id']) || empty($_POST['name'])) {
                sendResponse(false, "ID và Họ và Tên là bắt buộc.");
            }
            $id = $_POST['id'];

            $sql_select = "SELECT photo_uniform, photo_federation, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation FROM students WHERE id = ?";
            $stmt_select = $pdo->prepare($sql_select);
            $stmt_select->execute([$id]);
            $currentPaths = $stmt_select->fetch(PDO::FETCH_ASSOC);

            $photoUniformPath = handleImageUpload('photoUniform') ?: $currentPaths['photo_uniform'];
            $photoFederationPath = handleImageUpload('photoFederation') ?: $currentPaths['photo_federation'];
            $diplomaUniformPath = handleImageUpload('diplomaUniform') ?: $currentPaths['diploma_uniform'];
            $diplomaFederationPath = handleImageUpload('diplomaFederation') ?: $currentPaths['diploma_federation'];
            $scorecardUniformPath = handleImageUpload('scorecardUniform') ?: $currentPaths['scorecard_uniform'];
            $scorecardFederationPath = handleImageUpload('scorecardFederation') ?: $currentPaths['scorecard_federation'];

            $promotionTestUniform = isset($_POST['promotionTestUniform']) ? 1 : 0;
            $promotionTestFederation = isset($_POST['promotionTestFederation']) ? 1 : 0;
            $groupId = $_POST['groupId'] ?? null;
            $url = extractGoogleDriveFileId($_POST['url'] ?? null);

            $sql = "UPDATE students SET student_code=?, name=?, dharma_name=?, gender=?, dob=?, id_card=?, pob=?, address=?, photo_uniform=?, photo_federation=?, belt=?, federation_belt=?, diploma_uniform=?, diploma_federation=?, scorecard_uniform=?, scorecard_federation=?, club=?, status=?, phone_number=?, coach=?, group_id=?, education_level=?, promotion_test_uniform=?, promotion_test_federation=?, height_cm=?, weight_kg=?, url=?, registered_level=? WHERE id=?";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([
                $_POST['studentCode'], $_POST['name'], $_POST['dharmaName'] ?? null, $_POST['gender'] ?? null, $_POST['dob'] ?? null, $_POST['idCard'] ?? null, $_POST['pob'] ?? null, $_POST['address'] ?? null,
                $photoUniformPath, $photoFederationPath, $_POST['belt'] ?? null, $_POST['federationBelt'] ?? null, $diplomaUniformPath, $diplomaFederationPath, $scorecardUniformPath,
                $scorecardFederationPath, $_POST['club'] ?? null, $_POST['status'] ?? null, $_POST['phoneNumber'] ?? null, $_POST['coach'] ?? null, $groupId, $_POST['educationLevel'] ?? null,
                $promotionTestUniform, $promotionTestFederation, $_POST['height_cm'] ?? null, $_POST['weight_kg'] ?? null, $url, $_POST['registered_level'] ?? null, $id
            ]);
            sendResponse($success, $success ? "Cập nhật võ sinh thành công." : "Lỗi khi cập nhật võ sinh.");
            break;

        case 'delete':
            if (empty($_POST['id'])) {
                sendResponse(false, "Không tìm thấy ID võ sinh để xóa.");
            }
            $id = $_POST['id'];

            $sql_select = "SELECT photo_uniform, photo_federation, diploma_uniform, diploma_federation, scorecard_uniform, scorecard_federation FROM students WHERE id = ?";
            $stmt_select = $pdo->prepare($sql_select);
            $stmt_select->execute([$id]);
            $paths = $stmt_select->fetch(PDO::FETCH_ASSOC);

            if ($paths) {
                foreach ($paths as $path) {
                    if ($path && file_exists($path)) {
                        unlink($path);
                    }
                }
            }

            $sql_delete = "DELETE FROM students WHERE id=?";
            $stmt_delete = $pdo->prepare($sql_delete);
            $success = $stmt_delete->execute([$id]);
            sendResponse($success, $success ? "Xóa võ sinh thành công." : "Lỗi khi xóa võ sinh.");
            break;

        case 'add_exercise':
            if (empty($_POST['name']) || empty($_POST['type'])) {
                sendResponse(false, "Tên bài tập và loại là bắt buộc.");
            }
            $sql = "INSERT INTO exercises (name, belt, type, guide_url) VALUES (?, ?, ?, ?)";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([
                $_POST['name'], $_POST['belt'] ?? null, $_POST['type'], $_POST['guide_url'] ?? null
            ]);
            sendResponse($success, $success ? "Thêm bài tập thành công." : "Lỗi khi thêm bài tập.");
            break;

        case 'update_progress':
            if (empty($_POST['student_id']) || empty($_POST['exercise_id'])) {
                sendResponse(false, "ID võ sinh và ID bài tập là bắt buộc.");
            }
            $student_id = $_POST['student_id'];
            $exercise_id = $_POST['exercise_id'];
            $is_completed = (int)($_POST['is_completed'] ?? 0);

            $sql_check = "SELECT id FROM student_exercises WHERE student_id = ? AND exercise_id = ?";
            $stmt_check = $pdo->prepare($sql_check);
            $stmt_check->execute([$student_id, $exercise_id]);

            if ($stmt_check->rowCount() > 0) {
                $sql = "UPDATE student_exercises SET is_completed = ?, completed_at = ? WHERE student_id = ? AND exercise_id = ?";
                $stmt = $pdo->prepare($sql);
                $success = $stmt->execute([
                    $is_completed, $is_completed ? date('Y-m-d H:i:s') : null, $student_id, $exercise_id
                ]);
            } else {
                $sql = "INSERT INTO student_exercises (student_id, exercise_id, is_completed, completed_at) VALUES (?, ?, ?, ?)";
                $stmt = $pdo->prepare($sql);
                $success = $stmt->execute([
                    $student_id, $exercise_id, $is_completed, $is_completed ? date('Y-m-d H:i:s') : null
                ]);
            }
            sendResponse($success, $success ? "Cập nhật tiến độ thành công." : "Lỗi khi cập nhật tiến độ.");
            break;

        case 'update_all_progress':
            if (empty($_POST['student_id'])) {
                sendResponse(false, "ID võ sinh là bắt buộc.");
            }
            $student_id = $_POST['student_id'];
            $completed_exercises = json_decode($_POST['completed_exercises'], true);

            $pdo->beginTransaction();
            try {
                $sql_delete = "DELETE FROM student_exercises WHERE student_id = ?";
                $stmt_delete = $pdo->prepare($sql_delete);
                $stmt_delete->execute([$student_id]);

                if (!empty($completed_exercises)) {
                    $sql_insert = "INSERT INTO student_exercises (student_id, exercise_id, is_completed, completed_at) VALUES (?, ?, 1, NOW())";
                    $stmt_insert = $pdo->prepare($sql_insert);
                    foreach ($completed_exercises as $exercise_id) {
                        $stmt_insert->execute([$student_id, $exercise_id]);
                    }
                }
                $pdo->commit();
                sendResponse(true, "Cập nhật tiến độ thành công.");
            } catch (Exception $e) {
                $pdo->rollBack();
                sendResponse(false, "Lỗi khi cập nhật tiến độ: " . $e->getMessage());
            }
            break;

        case 'update_exercise':
            if (empty($_POST['id']) || empty($_POST['name']) || empty($_POST['type'])) {
                sendResponse(false, "ID, tên bài tập và loại là bắt buộc.");
            }
            $id = $_POST['id'];
            $sql = "UPDATE exercises SET name = ?, belt = ?, type = ?, guide_url = ? WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([
                $_POST['name'], $_POST['belt'] ?? null, $_POST['type'], $_POST['guide_url'] ?? null, $id
            ]);
            sendResponse($success, $success ? "Cập nhật bài tập thành công." : "Lỗi khi cập nhật bài tập.");
            break;

        case 'delete_exercise':
            if (empty($_POST['id'])) {
                sendResponse(false, "Không tìm thấy ID bài tập để xóa.");
            }
            $id = $_POST['id'];
            $sql = "DELETE FROM exercises WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([$id]);
            sendResponse($success, $success ? "Xóa bài tập thành công." : "Lỗi khi xóa bài tập.");
            break;

        case 'update_student_group':
            if (empty($_POST['id'])) {
                sendResponse(false, "ID võ sinh là bắt buộc.");
            }
            $id = $_POST['id'];
            $groupId = $_POST['group_id'] ?? null;

            $sql = "UPDATE students SET group_id = ? WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([$groupId, $id]);
            sendResponse($success, $success ? "Cập nhật nhóm thành công." : "Lỗi khi cập nhật nhóm.");
            break;

        case 'record_attendance':
            if (empty($_POST['student_id']) || empty($_POST['status']) || empty($_POST['attendance_date'])) {
                sendResponse(false, "ID võ sinh, trạng thái và ngày điểm danh là bắt buộc.");
            }
            $student_id = $_POST['student_id'];
            $status = $_POST['status'];
            $date = $_POST['attendance_date'];

            $stmt_group = $pdo->prepare("SELECT group_id FROM students WHERE id = ?");
            $stmt_group->execute([$student_id]);
            $student_group = $stmt_group->fetch(PDO::FETCH_ASSOC);
            $group_id = $student_group['group_id'];

            $sql = "INSERT INTO attendance (student_id, attendance_date, status, group_id) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE status = VALUES(status)";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([$student_id, $date, $status, $group_id]);
            sendResponse($success, $success ? "Điểm danh thành công." : "Lỗi khi điểm danh.");
            break;

        case 'update_student_info':
            if (empty($_POST['id'])) {
                sendResponse(false, "ID võ sinh là bắt buộc để cập nhật.");
            }
            $id = $_POST['id'];
            $url = extractGoogleDriveFileId($_POST['url'] ?? null);

            $sql = "UPDATE students SET
                        belt = ?,
                        registered_level = ?,
                        federation_belt_date = ?,
                        federation_belt_location = ?,
                        federation_belt_authority = ?,
                        height_cm = ?,
                        weight_kg = ?,
                        url = ?,
                        pob = ?
                    WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $success = $stmt->execute([
                $_POST['belt'] ?? null,
                $_POST['registered_level'] ?? null,
                $_POST['federation_belt_date'] ?? null,
                $_POST['federation_belt_location'] ?? null,
                $_POST['federation_belt_authority'] ?? null,
                $_POST['height_cm'] ?? null,
                $_POST['weight_kg'] ?? null,
                $url,
                $_POST['pob'] ?? null,
                $id
            ]);

            sendResponse($success, $success ? "Cập nhật thông tin võ sinh thành công." : "Lỗi khi cập nhật thông tin võ sinh.");
            break;

        default:
            sendResponse(false, "Hành động POST không hợp lệ.");
            break;
    }
}

// Hàm xử lý các yêu cầu GET
function handleGetRequest($pdo, $action) {
    switch ($action) {
        case 'get_single_exercise':
            if (empty($_GET['id'])) {
                sendResponse(false, "ID bài tập là bắt buộc.");
            }
            $id = $_GET['id'];
            $sql = "SELECT * FROM exercises WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            $exercise = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($exercise) {
                sendResponse(true, "Lấy thông tin bài tập thành công.", $exercise);
            } else {
                sendResponse(false, "Không tìm thấy bài tập.");
            }
            break;

        case 'read':
            $where_clauses = [];
            $params = [];

            if (!empty($_GET['club'])) {
                $where_clauses[] = "club = ?";
                $params[] = $_GET['club'];
            }
            if (!empty($_GET['belt'])) {
                $where_clauses[] = "belt = ?";
                $params[] = $_GET['belt'];
            }
            if (!empty($_GET['federationBelt'])) {
                $where_clauses[] = "federation_belt = ?";
                $params[] = $_GET['federationBelt'];
            }
            if (!empty($_GET['status'])) {
                $where_clauses[] = "status = ?";
                $params[] = $_GET['status'];
            }
            if (!empty($_GET['coach'])) {
                $where_clauses[] = "coach = ?";
                $params[] = $_GET['coach'];
            }
            if (!empty($_GET['gender'])) {
                $where_clauses[] = "gender = ?";
                $params[] = $_GET['gender'];
            }
            if (isset($_GET['promotionUniform']) && $_GET['promotionUniform'] == '1') {
                $where_clauses[] = "promotion_test_uniform = 1";
            }
            if (isset($_GET['promotionFederation']) && $_GET['promotionFederation'] == '1') {
                $where_clauses[] = "promotion_test_federation = 1";
            }

            $sql = "SELECT s.*, g.name AS group_name FROM students s LEFT JOIN groups g ON s.group_id = g.id";
            if (!empty($where_clauses)) {
                $sql .= " WHERE " . implode(" AND ", $where_clauses);
            }
            $sql .= " ORDER BY s.name ASC";

            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $students = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($students as &$row) {
                $progress_data = get_student_progress_data($pdo, $row['id'], $row['belt']);
                $row['progress_percentage'] = $progress_data['progress_percentage'];
                $row['completed_exercises'] = $progress_data['completed_exercises'];
                $row['total_exercises'] = $progress_data['total_exercises'];
            }

            sendResponse(true, "Tải dữ liệu thành công.", ["students" => $students]);
            break;

        case 'get_single':
            if (empty($_GET['id'])) {
                sendResponse(false, "ID võ sinh là bắt buộc.");
            }
            $id = $_GET['id'];
            $sql = "SELECT * FROM students WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            $student = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($student) {
                sendResponse(true, "Lấy thông tin võ sinh thành công.", $student);
            } else {
                sendResponse(false, "Không tìm thấy võ sinh.");
            }
            break;

        case 'get_filters':
            $filters = [
                'club' => [],
                'belt' => [],
                'federationBelt' => [],
                'status' => [],
                'coach' => [],
                'group' => [],
            ];

            $filters['club'] = $pdo->query("SELECT DISTINCT club FROM students WHERE club IS NOT NULL AND club != '' ORDER BY club ASC")->fetchAll(PDO::FETCH_COLUMN);
            $filters['belt'] = $pdo->query("SELECT DISTINCT belt FROM students WHERE belt IS NOT NULL AND belt != '' ORDER BY belt ASC")->fetchAll(PDO::FETCH_COLUMN);
            $filters['federationBelt'] = $pdo->query("SELECT DISTINCT federation_belt FROM students WHERE federation_belt IS NOT NULL AND federation_belt != '' ORDER BY federation_belt ASC")->fetchAll(PDO::FETCH_COLUMN);
            $filters['status'] = $pdo->query("SELECT DISTINCT status FROM students WHERE status IS NOT NULL AND status != '' ORDER BY status ASC")->fetchAll(PDO::FETCH_COLUMN);
            $filters['coach'] = $pdo->query("SELECT DISTINCT coach FROM students WHERE coach IS NOT NULL AND coach != '' ORDER BY coach ASC")->fetchAll(PDO::FETCH_COLUMN);
            $filters['group'] = $pdo->query("SELECT id, name FROM groups ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);

            sendResponse(true, "Lấy danh sách bộ lọc thành công.", $filters);
            break;

        case 'get_all_exercises':
            $sql = "SELECT * FROM exercises ORDER BY belt ASC, type ASC, name ASC";
            $stmt = $pdo->query($sql);
            $exercises = $stmt->fetchAll(PDO::FETCH_ASSOC);
            sendResponse(true, "Lấy danh sách bài tập thành công.", $exercises);
            break;

        case 'get_student_progress':
            if (empty($_GET['student_id']) || empty($_GET['belt'])) {
                sendResponse(false, "ID võ sinh và cấp đai là bắt buộc.");
            }
            $student_id = $_GET['student_id'];
            $belt = $_GET['belt'];

            $sql = "SELECT e.id, e.name, e.belt, e.guide_url, e.type, se.is_completed FROM exercises e LEFT JOIN student_exercises se ON e.id = se.exercise_id AND se.student_id = ? WHERE e.belt = ? ORDER BY e.name";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$student_id, $belt]);
            $progress = $stmt->fetchAll(PDO::FETCH_ASSOC);
            sendResponse(true, "Lấy tiến độ bài tập thành công.", $progress);
            break;

        case 'get_groups':
            $sql = "SELECT id, name FROM groups ORDER BY id ASC";
            $stmt = $pdo->query($sql);
            $groups = $stmt->fetchAll(PDO::FETCH_ASSOC);
            sendResponse(true, "Tải danh sách nhóm thành công.", $groups);
            break;

        case 'get_attendance_data':
            $date = $_GET['date'] ?? date('Y-m-d');
            $group_id = $_GET['group_id'] ?? null;

            $params = [$date];
            $sql = "SELECT s.id, s.name, s.photo_federation, s.group_id, g.name AS group_name, a.status FROM students s LEFT JOIN groups g ON s.group_id = g.id LEFT JOIN attendance a ON s.id = a.student_id AND a.attendance_date = ?";

            if ($group_id) {
                $sql .= " WHERE s.group_id = ?";
                $params[] = $group_id;
            }

            $sql .= " ORDER BY s.name ASC";

            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $students = $stmt->fetchAll(PDO::FETCH_ASSOC);
            sendResponse(true, "Tải dữ liệu điểm danh thành công.", ["students" => $students]);
            break;

        case 'get_attendance_summary':
            $date = $_GET['date'] ?? date('Y-m-d');
            $group_id = $_GET['group_id'] ?? null;

            $params = [$date];
            $sql_base = "FROM students s LEFT JOIN groups g ON s.group_id = g.id LEFT JOIN attendance a ON s.id = a.student_id AND a.attendance_date = ?";

            if ($group_id) {
                $sql_base .= " WHERE s.group_id = ?";
                $params[] = $group_id;
            }

            $sql_total = "SELECT COUNT(s.id) AS total_students " . $sql_base;
            $sql_present = "SELECT COUNT(a.id) AS present_count " . $sql_base . " AND a.status = 'present'";
            $sql_absent_wp = "SELECT COUNT(a.id) AS absent_with_permission_count " . $sql_base . " AND a.status = 'absent_with_permission'";
            $sql_absent_wop = "SELECT COUNT(a.id) AS absent_without_permission_count " . $sql_base . " AND a.status = 'absent_without_permission'";
            $sql_absent_details = "SELECT s.name, s.photo_federation, a.status FROM students s JOIN attendance a ON s.id = a.student_id WHERE a.attendance_date = ? AND a.status != 'present'";

            $stmt_total = $pdo->prepare($sql_total);
            $stmt_total->execute($params);
            $total_students = $stmt_total->fetchColumn();

            $stmt_present = $pdo->prepare($sql_present);
            $stmt_present->execute($params);
            $present_count = $stmt_present->fetchColumn();

            $stmt_absent_wp = $pdo->prepare($sql_absent_wp);
            $stmt_absent_wp->execute($params);
            $absent_with_permission_count = $stmt_absent_wp->fetchColumn();

            $stmt_absent_wop = $pdo->prepare($sql_absent_wop);
            $stmt_absent_wop->execute($params);
            $absent_without_permission_count = $stmt_absent_wop->fetchColumn();

            $absent_params = [$date];
            if ($group_id) {
                $sql_absent_details .= " AND s.group_id = ?";
                $absent_params[] = $group_id;
            }
            $stmt_absent_details = $pdo->prepare($sql_absent_details);
            $stmt_absent_details->execute($absent_params);
            $absent_details = $stmt_absent_details->fetchAll(PDO::FETCH_ASSOC);

            sendResponse(true, "Tải dữ liệu tổng quan thành công.", [
                "total_students" => $total_students,
                "present_count" => $present_count,
                "absent_with_permission_count" => $absent_with_permission_count,
                "absent_without_permission_count" => $absent_without_permission_count,
                "absent_details" => $absent_details,
            ]);
            break;

        default:
            sendResponse(false, "Hành động GET không hợp lệ.");
            break;
    }
}

// Hàm hỗ trợ lấy dữ liệu tiến độ
function get_student_progress_data($pdo, $student_id, $belt) {
    $progress = ['total_exercises' => 0, 'completed_exercises' => 0, 'progress_percentage' => 0];

    if (empty($belt)) {
        return $progress;
    }

    try {
        $sql_total = "SELECT COUNT(*) FROM exercises WHERE belt = ?";
        $stmt_total = $pdo->prepare($sql_total);
        $stmt_total->execute([$belt]);
        $total_exercises = $stmt_total->fetchColumn();
        $progress['total_exercises'] = $total_exercises;

        if ($total_exercises > 0) {
            $sql_completed = "SELECT COUNT(*) FROM student_exercises se JOIN exercises e ON se.exercise_id = e.id WHERE se.student_id = ? AND se.is_completed = 1 AND e.belt = ?";
            $stmt_completed = $pdo->prepare($sql_completed);
            $stmt_completed->execute([$student_id, $belt]);
            $completed_exercises = $stmt_completed->fetchColumn();
            $progress['completed_exercises'] = $completed_exercises;

            $progress['progress_percentage'] = round(($completed_exercises / $total_exercises) * 100);
        }
    } catch (Exception $e) {
        error_log("Lỗi khi lấy tiến độ võ sinh: " . $e->getMessage());
    }
    return $progress;
}

?>
