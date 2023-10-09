package com.example.coursemanagement.repository;

import java.util.List;

public interface IRepository<E> {
    List<E> showListE ();
    List<E> showListE (int currentPage);
    void saveE(E e);
    E selectE(int id);
    boolean deleteE(int id);
    boolean updateE(int id, E course);
    void updateE(E e);
}
