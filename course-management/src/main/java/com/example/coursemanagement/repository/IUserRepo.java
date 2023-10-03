package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.IService;

public interface IUserRepo extends IService<User> {
    boolean checkUsernameExits(String username);
    boolean checkExitsByUsernameAndPassword(String username, String password);
    User selectByUsername(String username);

}
