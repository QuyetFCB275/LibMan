<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chào mừng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }

        h1 {
            color: #28a745;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            font-size: 16px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            background-color: #007bff;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn.logout {
            background-color: #dc3545;
        }

        .btn.logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<h1>Chào mừng bạn đã đăng nhập thành công!</h1>
<div class="btn-container">
    <!-- Nút thay đổi thông tin -->
    <a href="update-info.jsp" class="btn">Thay đổi thông tin</a>

    <!-- Nút tìm thông tin tài liệu -->
    <a href="search-document642.jsp" class="btn">Tìm thông tin tài liệu</a>

    <!-- Nút đăng xuất -->
    <a href="logout.jsp" class="btn logout">Đăng xuất</a>
</div>
</body>
</html>
