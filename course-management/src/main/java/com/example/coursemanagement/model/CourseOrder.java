package com.example.coursemanagement.model;

public class CourseOrder {
    private int orderId;
    private String orderDate;
    private double orderPrice;
    private int userId;
    private int courseId;

    private double orderCode;

    private String status;

    public CourseOrder(int orderId, String orderDate, double orderPrice, int userId, int courseId, double orderCode,
                       String status) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.userId = userId;
        this.courseId = courseId;
        this.orderCode = orderCode;
        this.status = status;
    }

    public CourseOrder(int orderId, String orderDate, double orderPrice, int userId, int courseId) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
        this.userId = userId;
        this.courseId = courseId;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public double getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(double orderCode) {
        this.orderCode = orderCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
