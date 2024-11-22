<%@ page import="org.quyet.libman.model.Document" %>
<%@ page import="org.quyet.libman.dao.DocumentDAO" %>
<%@ page import="org.quyet.libman.dao.impl.DocumentDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Tài Liệu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
        }

        .document-detail {
            margin-top: 30px;
            text-align: left;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .document-detail h2 {
            color: #28a745;
        }

        .document-detail p {
            font-size: 16px;
        }

        .back-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
        /*.document-detail {*/
        /*    padding: 20px;*/
        /*    background-color: #f9f9f9;*/
        /*    border: 1px solid #ddd;*/
        /*    border-radius: 8px;*/
        /*    max-width: 800px;*/
        /*    margin: 20px auto;*/
        /*}*/

        /*.info-container {*/
        /*    display: flex;*/
        /*    flex-wrap: wrap;*/
        /*    align-items: flex-start;*/
        /*    justify-content: space-between;*/
        /*}*/

        /*.document-info {*/
        /*    flex: 1;*/
        /*    min-width: 250px;*/
        /*    margin-right: 20px;*/
        /*}*/

        /*.document-image {*/
        /*    flex: 0 0 200px;*/
        /*    text-align: center;*/
        /*}*/

        /*.document-image img {*/
        /*    max-width: 100%;*/
        /*    height: auto;*/
        /*    border-radius: 8px;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*}*/
        .info-container {
            display: flex;
            align-items: flex-start; /* Căn chỉnh phần trên cùng của hai khối */
            justify-content: space-between;
            margin-right: 50px;
        }

        .document-info {
            flex: 1;
            margin-right: 10px; /* Giảm khoảng cách giữa thông tin và hình ảnh */
        }

        .document-info p {
            margin: 5px 0;
            font-size: 16px;
        }

        .document-image {
            flex: 0 0 180px; /* Giữ kích thước cố định của ảnh */
            text-align: center;
        }

        .document-image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }


    </style>
</head>
<body>
<h1>Chi Tiết Tài Liệu</h1>

<%
    // Lấy dữ liệu từ request
    String documentId = request.getParameter("documentId");
    String documentName = request.getParameter("documentName");
    String author = request.getParameter("author");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String publisher = request.getParameter("publisher");
    String image = request.getParameter("image");

    if (documentId != null && !documentId.isEmpty()) {
%>
<div class="document-detail">
    <h2 class="document-title">Tên Tài Liệu: <%= documentName %></h2>
    <div class="info-container">
        <!-- Phần thông tin tài liệu -->
        <div class="document-info">
            <p><strong>Mã Tài Liệu:</strong> <%= documentId %></p>
            <p><strong>Tác Giả:</strong> <%= author %></p>
            <p><strong>Thể Loại:</strong> <%= category %></p>
            <p><strong>Giá:</strong> <%= price %></p>
            <p><strong>Nhà xuất bản:</strong> <%= publisher %></p>
        </div>

        <!-- Phần hình ảnh -->
        <% if (image != null && !image.isEmpty()) { %>
        <div class="document-image">
            <img src="<%= request.getContextPath() + "/" + image %>"
                 alt="Hình ảnh tài liệu">
        </div>
        <% } else { %>
        <div class="document-image">
            <p>Không có hình ảnh</p>
        </div>
        <% } %>
    </div>
</div>


<!-- Nút quay lại -->
<a href="search-document.jsp">
    <button class="back-button">Quay Lại</button>
</a>
<%
} else {
%>
<p style="color: red;">Không có thông tin tài liệu.</p>
<%
    }
%>
</body>
</html>