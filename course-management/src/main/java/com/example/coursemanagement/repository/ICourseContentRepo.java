package com.example.coursemanagement.repository;


import com.example.coursemanagement.model.CourseContent;

import java.util.List;

public interface ICourseContentRepo extends IRepository<CourseContent> {
    List<CourseContent> selectByCourseId(int id);
    CourseContent selectByDetailContentId(int idDetailContent);
}
