package com.example.coursemanagement.model;

public class Course {
    private int id;
    private String name;
    private String description;
    private String instructor;
    private double price;
    private int courseLevelId;
    private String knowledge;
    private String requirements;
    private String courseInclusion;

    public Course(int id, String name, String description, String instructor, double price, int courseLevelId, String knowledge, String requirements, String courseInclusion) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.courseLevelId = courseLevelId;
        this.knowledge = knowledge;
        this.requirements = requirements;
        this.courseInclusion = courseInclusion;
    }

    public Course(String name, String description, String instructor, double price, int courseLevelId, String knowledge, String requirements, String courseInclusion) {
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.courseLevelId = courseLevelId;
        this.knowledge = knowledge;
        this.requirements = requirements;
        this.courseInclusion = courseInclusion;
    }

    public Course(int id, String name, String description, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
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

    public String getDescription() {
            return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCourseLevelId() {
        return courseLevelId;
    }

    public void setCourseLevelId(int courseLevelId) {
        this.courseLevelId = courseLevelId;
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String device_requirements) {
        this.requirements = device_requirements;
    }

    public String getCourseInclusion() {
        return courseInclusion;
    }

    public void setCourseInclusion(String courseInclusion) {
        this.courseInclusion = courseInclusion;
    }
}
