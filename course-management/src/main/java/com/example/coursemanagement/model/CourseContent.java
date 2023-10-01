package com.example.coursemanagement.model;

public class CourseContent {
    private int id;
    private String name;
    private int courseId;

    public CourseContent(int id, String name,int courseId) {
        this.id = id;
        this.name = name;
        this.courseId = courseId;
    }

    public CourseContent(String name) {
        this.name = name;
        this.courseId = courseId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
