package com.example.coursemanagement.service;

import com.example.coursemanagement.model.CourseContent;

import java.util.List;

public interface ICourseContentService extends IService<CourseContent>{
    List<CourseContent> selectByCourseId(int id);
}
