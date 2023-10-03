package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.CourseDetailedContent;

import java.util.List;

public interface ICourseDetailRepo extends IRepository<CourseDetailedContent>{
    List<CourseDetailedContent> selectByCourseContentId(int id);
}
