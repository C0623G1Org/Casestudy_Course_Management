package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.Feedback;
import com.example.coursemanagement.repository.IRepository;
import com.example.coursemanagement.repository.impl.FeedbackRepoImpl;
import com.example.coursemanagement.service.IService;

import java.util.List;

public class FeedbackServiceImpl implements IService<Feedback> {
    private final IRepository<Feedback> feedbackRepo = new FeedbackRepoImpl();
    @Override
    public List<Feedback> showListE() {
        return feedbackRepo.showListE();
    }

    @Override
    public List<Feedback> showListE(int currentPage) {
        return feedbackRepo.showListE(currentPage);
    }

    @Override
    public void saveE(Feedback feedback) {

    }

    @Override
    public Feedback selectE(int id) {
        return null;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, Feedback course) {
        return false;
    }

    @Override
    public void updateE(Feedback feedback) {

    }
}
