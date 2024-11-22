<%@ page import="java.sql.*" %>
<%@ page import="org.quyet.libman.model.User" %>
<%@ page import="org.quyet.libman.dao.UserDAO" %>
<%@ page import="org.quyet.libman.dao.impl.UserDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .error, .success {
            text-align: center;
            margin: 10px 0;
            font-size: 14px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Đăng Ký</h1>
    <%
        String message = "";
        boolean isSuccess = false;

        if (request.getMethod().equalsIgnoreCase("POST")) {
            String fullName = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (fullName != null && username != null && password != null) {
                User user = new User(username, password, fullName);
                UserDAO userDAO = new UserDaoImpl();
                boolean isRegistered = userDAO.addUser(user);

                if (isRegistered) {
                    isSuccess = true;
                    message = "Đăng ký thành công!";
                } else {
                    message = "Đăng ký thất bại! Username đã tồn tại.";
                }
            } else {
                message = "Dữ liệu không hợp lệ!";
            }

            if (isSuccess) {
                // Chuyển hướng sang trang đăng nhập nếu thành công
                response.sendRedirect("index.jsp");
            }
        }
    %>

    <!-- Hiển thị thông báo -->
    <% if (!message.isEmpty()) { %>
    <div class="<%= isSuccess ? "success" : "error" %>"><%= message %></div>
    <% } %>

    <!-- Form Đăng Ký -->
    <form method="post">
        <input type="text" name="fullname" placeholder="Họ và tên" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>
        <button type="submit">Đăng Ký</button>
    </form>
</div>
</body>
</html>
