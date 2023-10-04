package com.example.coursemanagement.model;

public class Course {
    private int id;
    private String name;
    private String description;
    private String instructor;
    private double price;
    private int course_level_id;
    private String knowledge;
    private String requirements;
    private String course_inclusion;

    public Course(int id, String name, String description, String instructor, double price, int course_level_id, String knowledge, String requirements, String course_inclusion) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.course_level_id = course_level_id;
        this.knowledge = knowledge;
        this.requirements = requirements;
        this.course_inclusion = course_inclusion;
    }

    public Course(String name, String description, String instructor, double price, int course_level_id, String knowledge, String requirements, String course_inclusion) {
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.course_level_id = course_level_id;
        this.knowledge = knowledge;
        this.requirements = requirements;
        this.course_inclusion = course_inclusion;
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

    public int getCourse_level_id() {
        return course_level_id;
    }

    public void setCourse_level_id(int course_level_id) {
        this.course_level_id = course_level_id;
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

    public String getCourse_inclusion() {
        return course_inclusion;
    }

    public void setCourse_inclusion(String course_inclusion) {
        this.course_inclusion = course_inclusion;
    }
}
