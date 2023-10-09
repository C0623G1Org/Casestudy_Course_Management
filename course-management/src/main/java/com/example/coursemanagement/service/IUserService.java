package com.example.coursemanagement.service;

import com.example.coursemanagement.model.User;

public interface IUserService extends IService<User> {
    boolean checkUsernameExits(String username);
    boolean checkExitsByUsernameAndPassword(String username, String password);
    User selectByUsername(String username);
    void deleteUser(int id);

    void changePassWord(User user, String newPassWord);
    boolean checkExistEmail(String email);
    public int countUsersAmount();
}
