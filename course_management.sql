CREATE DATABASE course_management; 
USE course_management;

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    course_descreption VARCHAR(1000) NOT NULL,
    instructor VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    course_content_id INT,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id)
);

CREATE TABLE course_content (
    course_content_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_content_name VARCHAR(255) NOT NULL,
    course_content_descreption VARCHAR(1000) NOT NULL
);

CREATE TABLE video (
    video_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    video_title VARCHAR(255) NOT NULL,
    video_url VARCHAR(1000) NOT NULL,
    course_content_id INT,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id)
);

CREATE TABLE exercise (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    exercise_title VARCHAR(255) NOT NULL,
    exercise_content VARCHAR(1000) NOT NULL,
    course_content_id INT,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id)
);

CREATE TABLE theory (
    theory_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    theory_title VARCHAR(255) NOT NULL,
    theory_content VARCHAR(1000) NOT NULL,
    course_content_id INT,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id)
);

CREATE TABLE course_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    gender BIT NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    access_right BIT NOT NULL
);

CREATE TABLE course_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    order_date DATE NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES course_user (user_id)
);

CREATE TABLE detailed_order (
	order_id INT NOT NULL,
	course_id INT NOT NULL,
	PRIMARY KEY (order_id, course_id), 
	FOREIGN KEY (order_id) 
		REFERENCES course_order(order_id),
	FOREIGN KEY (course_id) 
		REFERENCES course(course_id)
);

