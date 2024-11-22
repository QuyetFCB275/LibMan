package org.quyet.libman.dao.impl;

import org.quyet.libman.dao.UserDAO642;
import org.quyet.libman.model.User642;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl642 implements UserDAO642 {
    private String jdbcURL="jdbc:mysql://localhost:3306/pttk?useSSL=false";
    private String jdbcUsername="root";
    private String jdbcPassword="12345";

    public UserDaoImpl642() {
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
    public User642 getById(String id) {
        return null;
    }

    @Override
    public Boolean addUser(User642 user) {
        String sql = "INSERT INTO tblUser642 (username, password, fullname) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullname());
            int rowsInserted = statement.executeUpdate();

            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User642> getAllUser() {
        return List.of();
    }
}
