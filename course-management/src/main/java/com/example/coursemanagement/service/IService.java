package com.example.coursemanagement.service;

import java.util.List;

public interface IService<E> {
    List<E> showListE ();
    void saveE(E e);
    E selectE(int id);
    boolean deleteE(int id);
    boolean updateE(int id, E course);
    void updateE(E e);
}
