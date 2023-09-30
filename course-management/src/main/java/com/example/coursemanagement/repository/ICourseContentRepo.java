package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.CourseContent;
import com.example.coursemanagement.service.IService;

import java.util.List;

public interface ICourseContentRepo extends IService<CourseContent> {
    List<CourseContent> selectByCourseId(int id);
}
