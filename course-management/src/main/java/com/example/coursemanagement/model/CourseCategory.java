package com.example.coursemanagement.model;

public class CourseCategory {
    private int id;
    private String name;

    public CourseCategory(String name) {
        this.name = name;
    }

    public CourseCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
