package com.example.coursemanagement.service;

import com.example.coursemanagement.model.CourseDetailedContent;

import java.util.List;

public interface ICourseDetailContentService extends IService<CourseDetailedContent>{
    List<CourseDetailedContent> selectByCourseContentId(int id);
}
