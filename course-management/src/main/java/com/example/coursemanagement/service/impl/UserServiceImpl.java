package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.User;
import com.example.coursemanagement.repository.IUserRepo;
import com.example.coursemanagement.repository.impl.UserRepoImpl;
import com.example.coursemanagement.service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private final IUserRepo userRepo = new UserRepoImpl();
    @Override
    public List<User> showListE() {
        return userRepo.showListE();
    }

    @Override
    public void saveE(User user) {
        userRepo.saveE(user);
    }

    @Override
    public User selectE(int id) {
        return userRepo.selectE(id);
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, User course) {
        return false;
    }

    @Override
    public void updateE(User user) {
        userRepo.updateE(user);
    }

    @Override
    public boolean checkUsernameExits(String username) {
        return userRepo.checkUsernameExits(username);
    }

    @Override
    public boolean checkExitsByUsernameAndPassword(String username, String password) {
        return userRepo.checkExitsByUsernameAndPassword(username,password);
    }

    @Override
    public User selectByUsername(String username) {
        return userRepo.selectByUsername(username);
    }
}
