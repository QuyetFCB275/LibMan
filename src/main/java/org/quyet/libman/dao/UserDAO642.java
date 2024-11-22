package org.quyet.libman.dao;

import org.quyet.libman.model.User642;

import java.util.List;

public interface UserDAO642 {
    User642 getById(String id);
    Boolean addUser(User642 user);
    List<User642> getAllUser();
}
