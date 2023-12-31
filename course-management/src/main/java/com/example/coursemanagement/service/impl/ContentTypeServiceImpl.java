package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.CourseContentType;
import com.example.coursemanagement.repository.IContentType;
import com.example.coursemanagement.repository.IRepository;
import com.example.coursemanagement.repository.impl.CourseContentTypeRepoImpl;
import com.example.coursemanagement.service.IService;

import java.util.List;

public class ContentTypeServiceImpl implements IContentType {
    private final IRepository<CourseContentType> contentTypeIRepository = new CourseContentTypeRepoImpl();

    @Override
    public List<CourseContentType> showListE() {
        return contentTypeIRepository.showListE();
    }

    @Override
    public List<CourseContentType> showListE(int currentPage) {
        return null;
    }

    @Override
    public void saveE(CourseContentType courseContentType) {

    }

    @Override
    public CourseContentType selectE(int id) {
        return contentTypeIRepository.selectE(id);
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseContentType course) {
        return false;
    }

    @Override
    public void updateE(CourseContentType courseContentType) {

    }
}
