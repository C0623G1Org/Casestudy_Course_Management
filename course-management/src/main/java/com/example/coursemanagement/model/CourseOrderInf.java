package com.example.coursemanagement.model;

public class CourseOrderInf {
    private int orderId;

    private double orderPrice;

    private int orderCode;

    private String status;

    private String fullName;

    private String courseName;

    private int phone;

    private String email;

    private double price;

    private String shorDescription;



    public CourseOrderInf(int orderId, double orderPrice, int orderCode, String status, String fullName, String courseName) {
        this.orderId = orderId;
        this.orderPrice = orderPrice;
        this.orderCode = orderCode;
        this.status = status;
        this.fullName = fullName;
        this.courseName = courseName;
    }

    public CourseOrderInf(int orderId, double orderPrice, int orderCode, String status, String fullName,
                          String courseName, int phone, String email, double price, String shorDescription) {
        this.orderId = orderId;
        this.orderPrice = orderPrice;
        this.orderCode = orderCode;
        this.status = status;
        this.fullName = fullName;
        this.courseName = courseName;
        this.phone = phone;
        this.email = email;
        this.price = price;
        this.shorDescription = shorDescription;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }
}
