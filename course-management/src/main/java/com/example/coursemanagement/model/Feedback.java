package com.example.coursemanagement.model;

public class Feedback {
    private int id;
    private String content;
    private User user;
    private CourseOrder order;

    public Feedback(int id, String content, User user, CourseOrder order) {
        this.id = id;
        this.content = content;
        this.user = user;
        this.order = order;
    }

    public Feedback(String content, User user, CourseOrder order) {
        this.content = content;
        this.user = user;
        this.order = order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public CourseOrder getOrder() {
        return order;
    }

    public void setOrder(CourseOrder order) {
        this.order = order;
    }
}
