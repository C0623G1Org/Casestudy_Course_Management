package com.example.coursemanagement.model;

import java.util.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String idCard;
    private Date birthday;
    private boolean gender;
    private String phone;
    private String email;
    private String role;

    public User(String username, String password, String fullName, String idCard, Date birthday, boolean gender, String phone, String email, String role) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idCard = idCard;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.role = role;
    }

    public User(int id, String username, String password, String fullName, String idCard, Date birthday, boolean gender, String phone, String email, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idCard = idCard;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.role = role;
    }

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}

