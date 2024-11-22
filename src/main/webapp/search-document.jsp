<%@ page import="java.util.List" %>
<%@ page import="org.quyet.libman.model.Document" %>
<%@ page import="org.quyet.libman.dao.DocumentDAO" %>
<%@ page import="org.quyet.libman.dao.impl.DocumentDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm Thông Tin Tài Liệu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            margin-top: 20px;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Tìm Thông Tin Tài Liệu</h1>

<!-- Form tìm kiếm tài liệu theo tên -->
<form method="post">
    <input type="text" name="documentName" placeholder="Nhập tên tài liệu" required>
    <button type="submit">Tìm kiếm</button>
</form>

<%
    // Xử lý tìm kiếm khi form được submit
    String documentName = request.getParameter("documentName");
    if (documentName != null && !documentName.isEmpty()) {
        DocumentDAO documentDAO = new DocumentDaoImpl();
        List<Document> documents = documentDAO.getDocumentsByName(documentName);

        // Hiển thị kết quả tìm kiếm
        if (documents != null && !documents.isEmpty()) {
%>
<h3>Kết quả tìm kiếm cho: "<%= documentName %>"</h3>
<table>
    <thead>
    <tr>
        <th>Mã Tài Liệu</th>
        <th>Tên Tài Liệu</th>
        <th>Tác Giả</th>
        <th>Thể Loại</th>
        <th>Giá</th>
        <th>Nhà cung cấp</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Document doc : documents) {
    %>
    <tr>
        <td><%= doc.getId() %></td>
        <td>
            <!-- Form truyền dữ liệu chi tiết tài liệu -->
            <form action="document-detail.jsp" method="post" style="margin: 0;">
                <input type="hidden" name="documentId" value="<%= doc.getId() %>">
                <input type="hidden" name="documentName" value="<%= doc.getName() %>">
                <input type="hidden" name="author" value="<%= doc.getAuthor() %>">
                <input type="hidden" name="category" value="<%= doc.getCategory() %>">
                <input type="hidden" name="price" value="<%= doc.getPrice() %>">
                <input type="hidden" name="publisher" value="<%= doc.getPublisher() %>">
                <input type="hidden" name="image" value="<%= doc.getImage() %>">
                <button type="submit" style="background: none; border: none; color: #007bff; text-decoration: underline; cursor: pointer;">
                    <%= doc.getName() %>
                </button>
            </form>
        </td>
        <td><%= doc.getAuthor() %></td>
        <td><%= doc.getCategory() %></td>
        <td><%= doc.getPrice() %></td>
        <td><%= doc.getPublisher()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p>Không tìm thấy tài liệu với tên "<%= documentName %>".</p>
<%
        }
    }
%>
</body>
</html>
