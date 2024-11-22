<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            width: 300px;
            margin: 50px auto;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .register-btn {
            margin-top: 20px;
            background-color: #28a745;
        }

        .register-btn:hover {
            background-color: #218838;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;">Đăng Nhập</h1>

<div class="form-container">
    <%
        // Biến để hiển thị thông báo lỗi
        String errorMessage = "";

        // Xử lý đăng nhập
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Kết nối cơ sở dữ liệu
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Kết nối với database
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pttk", "root", "12345");

                // Kiểm tra thông tin đăng nhập
                String sql = "SELECT * FROM tblUser642 WHERE username = ? AND password = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Đăng nhập thành công, chuyển hướng
                    response.sendRedirect("welcome642.jsp");
                } else {
                    // Đăng nhập thất bại
                    errorMessage = " username hoặc mật khẩu không đúng. Vui lòng thử lại.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage = "Đã xảy ra lỗi khi kết nối cơ sở dữ liệu.";
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

    <!-- Hiển thị thông báo lỗi -->
    <div class="error"><%= errorMessage %></div>

    <!-- Form Đăng Nhập -->
    <form method="post">
        <input type="text" name="username" placeholder="Nhập username" required>
        <input type="password" name="password" placeholder="Nhập Mật khẩu" required>
        <button type="submit">Đăng Nhập</button>
    </form>

    <!-- Nút Đăng Ký -->
    <form action="register642.jsp" method="get">
        <button type="submit" class="register-btn">Đăng Ký</button>
    </form>
</div>
</body>
</html>
