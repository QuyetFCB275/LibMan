package org.quyet.libman.dao.impl;

import org.quyet.libman.dao.DocumentDAO;
import org.quyet.libman.model.Document;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DocumentDaoImpl implements DocumentDAO {
    private String jdbcURL="jdbc:mysql://localhost:3306/pttk?useSSL=false";
    private String jdbcUsername="root";
    private String jdbcPassword="12345";

    public DocumentDaoImpl() {
    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Document> getDocumentsByName(String name) {
        List<Document> documents = new ArrayList<>();

        // Kết nối database và tìm kiếm tài liệu
        try (Connection connection = getConnection()) {
            String sql = "SELECT * FROM tblDocument WHERE name LIKE ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%"); // Tìm kiếm tài liệu có tên chứa từ khóa
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Document doc = new Document(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("author"),
                        rs.getString("category"),
                        rs.getFloat("price"),
                        rs.getString("publisher"),
                        rs.getString("image")
                );
                documents.add(doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return documents;
    }

    // Các phương thức khác như getDocumentById()...
}