package com.example.coursemanagement.model;

public class CourseOrder {
    private int orderId;
    private String orderDate;
    private double orderPrice;
    private User user;
    private Course course;

    private int orderCode;

    private String status;

    public CourseOrder(int orderId, String orderDate, double orderPrice, User user, Course course, int orderCode,
                       String status) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.user = user;
        this.course = course;
        this.orderCode = orderCode;
        this.status = status;
    }

    public CourseOrder(int orderId, String orderDate, double orderPrice, User user, Course course) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.user = user;
        this.course = course;
    }

    public CourseOrder(String orderDate, double orderPrice, User user, Course course, int orderCode, String status) {
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.user = user;
        this.course = course;
        this.orderCode = orderCode;
        this.status = status;
    }

    public CourseOrder(String orderDate, double orderPrice, User user, Course course, int orderCode) {
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.user = user;
        this.course = course;
        this.orderCode = orderCode;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(int orderCode) {
        this.orderCode = orderCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
