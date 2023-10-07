package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.Feedback;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.IRepository;
import com.example.coursemanagement.repository.IUserRepo;
import com.example.coursemanagement.service.ICourseOrderService;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.CourseOrderServiceImpl;
import com.example.coursemanagement.service.impl.UserServiceImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FeedbackRepoImpl implements IRepository<Feedback> {
    private final IUserService userService = new UserServiceImpl();
    private final ICourseOrderService orderService = new CourseOrderServiceImpl();
    private final String SELECT_ALL = "SELECT * FROM feed_backs fb JOIN course_orders co ON fb.order_id = co.order_id WHERE co.status = 'success';";
    @Override
    public List<Feedback> showListE() {
        List<Feedback> feedbacks = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL);
            while (resultSet.next()){
                int id = resultSet.getInt("feedback_id");
                String content = resultSet.getString("content_feedback");
                int userId = resultSet.getInt("user_id");
                int orderId = resultSet.getInt("order_id");
                User user = userService.selectE(userId);
                CourseOrder order = orderService.showOrderById(orderId);
                feedbacks.add(new Feedback(id,content,user,order));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return feedbacks;    }

    @Override
    public void saveE(Feedback feedback) {

    }

    @Override
    public Feedback selectE(int id) {
        return null;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, Feedback course) {
        return false;
    }

    @Override
    public void updateE(Feedback feedback) {

    }
}
