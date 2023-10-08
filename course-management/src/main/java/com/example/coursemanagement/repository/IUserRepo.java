package com.example.coursemanagement.repository;


import com.example.coursemanagement.model.User;

public interface IUserRepo extends IRepository<User> {
    boolean checkUsernameExits(String username);
    boolean checkExitsByUsernameAndPassword(String username, String password);
    User selectByUsername(String username);
    void deleteUser(int id);
    void changePassWord(User user, String newPassWord);
    boolean checkExistEmail(String email);

}
