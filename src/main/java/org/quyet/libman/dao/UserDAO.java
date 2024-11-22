package org.quyet.libman.dao;

import org.quyet.libman.model.User;

import java.util.List;

public interface UserDAO {
    User getById(String id);
    Boolean addUser(User user);
    List<User> getAllUser();
}
