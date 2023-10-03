package com.example.coursemanagement.model;

public class CourseOrder {
    private int order_id;
    private String order_date;
    private double order_price;
    private int user_id;
    private int course_id;

    public CourseOrder(int order_id, String order_date, double order_price, int user_id, int course_id) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.order_price = order_price;
        this.user_id = user_id;
        this.course_id = course_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public double getOrder_price() {
        return order_price;
    }

    public void setOrder_price(double order_price) {
        this.order_price = order_price;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
