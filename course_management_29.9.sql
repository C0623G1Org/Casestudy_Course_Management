CREATE DATABASE course_management_ver2; 
USE course_management_ver2;

CREATE TABLE course_levels (
    course_level_id INT AUTO_INCREMENT PRIMARY KEY,
    course_level_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    short_description LONGTEXT NOT NULL,
    instructor VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    knowledge VARCHAR(500),
    requirements VARCHAR(500),
    course_inclusion VARCHAR(200),
	course_level_id INT NOT NULL,
    FOREIGN KEY (course_level_id)
        REFERENCES course_levels (course_level_id)
);

CREATE TABLE course_content (
    course_content_id INT AUTO_INCREMENT PRIMARY KEY,
    course_content_name VARCHAR(150) NOT NULL UNIQUE,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
);

CREATE TABLE content_types (
	content_type_id INT AUTO_INCREMENT PRIMARY KEY,
    content_type_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE detailed_course_content (
	detailed_course_content_id INT AUTO_INCREMENT PRIMARY KEY,
    content_title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    url_video_id VARCHAR(50),
    course_content_id INT NOT NULL,
    content_type_id INT NOT NULL,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id),
	FOREIGN KEY (content_type_id)
        REFERENCES content_types (content_type_id)
);

CREATE TABLE `user` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(120) NOT NULL, 
    full_name VARCHAR(60),
    id_card VARCHAR(12) UNIQUE,
    birthday DATE,
    gender BIT,
    phone VARCHAR(10) UNIQUE,
    email VARCHAR(55) NOT NULL UNIQUE,
    `role` VARCHAR(10) NOT NULL, 
    CHECK (`role`= "admin" OR `role`= "user")
);

CREATE TABLE course_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_code INT NOT NULL UNIQUE,
    `status` VARCHAR(55), 
    order_date DATE NOT NULL,
    order_price DOUBLE NOT NULL,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES `user` (user_id),
	FOREIGN KEY (course_id) 
		REFERENCES courses (course_id)
);

INSERT INTO course_levels (course_level_name) VALUES ('BEGINNER');
INSERT INTO course_levels (course_level_name) VALUES ('INTERMEDIATE');
INSERT INTO course_levels (course_level_name) VALUES ('ADVANCED');

INSERT INTO courses (course_name, short_description, instructor, price, course_level_id, knowledge, requirements,course_inclusion) 
VALUES ('HTML and CSS', 'Learn the basics of HTML and CSS to build beautiful websites.', 'John Smith', 24.99, 1, 
'<p>Cách sử dụng ngôn ngữ đánh dấu HTML để tạo các phần tử trên trang web.</p>
<p>Cách sử dụng CSS để định dạng và trình bày các phần tử trên trang web.</p>
<p>Cách tạo các layout và thiết kế trang web chuyên nghiệp.</p>
<p>Cách phối hợp HTML và CSS để tạo ra các trang web độc đáo.</p>
<p>Cách làm việc với responsive design và mobile optimization.</p>', 
'<p>Có kiến thức cơ bản về máy tính và trình duyệt web.</p>
<p>Có kiến thức cơ bản về HTML và CSS là một lợi thế, nhưng không bắt buộc.</p>',
'
<p>Giờ học: 200 giờ học</p>
<p>Thời gian khóa học: 4 tháng;</p>
<p>Số bài học: 20 bài</p>
'
);

INSERT INTO courses (course_name, short_description, instructor, price, course_level_id, knowledge, requirements,course_inclusion) 
VALUES ('Python for Data Science', 'Learn the Python programming language and how it is used in data science.', 'Jane Doe', 49.99, 2, 
'<p>Các khái niệm cơ bản của khoa học dữ liệu và các công cụ phân tích dữ liệu cơ bản.</p>
<p>Các cú pháp, tập lệnh và thư viện phương tiện trong Python, như pandas, numpy và matplotlib.</p>
<p>Các phương pháp phân tích dữ liệu thống kê như biểu đồ và hồi quy tuyến tính.</p>
<p>Cách sử dụng Python để xử lý, phân tích và hiểu dữ liệu.</p>', 
'<p>Nắm vững kiến thức cơ bản về lập trình và Python.</p>
<p>Có kiến ​​thức cơ bản về toán học, thống kê và phân tích dữ liệu là một lợi thế, nhưng không bắt buộc.</p>',
'
<p>Giờ học: 200 giờ học</p>
<p>Thời gian khóa học: 4 tháng;</p>
<p>Số bài học: 20 bài</p>
'
);

INSERT INTO courses (course_name, short_description, instructor, price, course_level_id, knowledge, requirements,course_inclusion) 
VALUES ('React Native', 'Build mobile apps for iOS and Android using React Native.', 'Mike Thompson', 99.99, 3, 
'<p>Các khái niệm cơ bản về React Native và cách nó hoạt động.</p>
<p>Các phương pháp phát triển ứng dụng di động và thiết kế giao diện trong React Native.</p>
<p>Cách sử dụng các thành phần và thư viện của React Native để tạo các tính năng và chức năng.</p>
<p>Cách sử dụng JavaScript để lập trình ứng dụng React Native và tương tác với các API.</p>', 
'<p>Có kiến thức cơ bản về lập trình và JavaScript.</p>
<p>Có kiến thức cơ bản về lập trình di động là một lợi thế, nhưng không bắt buộc.</p>',
'
<p>Giờ học: 200 giờ học</p>
<p>Thời gian khóa học: 4 tháng;</p>
<p>Số bài học: 20 bài</p>
'
);

INSERT INTO course_content (course_content_name,course_id) VALUES ('String',1);
INSERT INTO course_content (course_content_name,course_id) VALUES ('Array',1);
INSERT INTO course_content (course_content_name,course_id) VALUES ('OOP',1);
INSERT INTO course_content (course_content_name,course_id) VALUES ('Data Science',2);
INSERT INTO course_content (course_content_name,course_id) VALUES ('Mobile App Development',3);

INSERT INTO content_types (content_type_name) VALUES ('Lesson');
INSERT INTO content_types (content_type_name) VALUES ('Readings');
INSERT INTO content_types (content_type_name) VALUES ('Exercise');

INSERT INTO detailed_course_content (content_title, content, url_video_id, course_content_id, content_type_id) 
VALUES ('Introduction to HTML', 'HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps', 1, 1);
INSERT INTO detailed_course_content (content_title, content, url_video_id, course_content_id, content_type_id) 
VALUES ('Introduction to HTML 2', 'HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps', 1, 1);
INSERT INTO detailed_course_content (content_title, content, url_video_id, course_content_id, content_type_id) 
VALUES ('Introduction to HTML 3', 'HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps', 1, 1);
INSERT INTO detailed_course_content (content_title, content, url_video_id, course_content_id, content_type_id) 
VALUES ('Introduction to HTML 4', 'HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps', 1, 1);


INSERT INTO detailed_course_content (content_title, content, url_video_id , course_content_id, content_type_id) 
VALUES ('CSS Selectors', 'Learn how to select HTML elements using CSS selectors.','0SJE9dYdpps', 1, 2);
INSERT INTO detailed_course_content (content_title, content, url_video_id , course_content_id, content_type_id) 
VALUES ('Python Data Types', 'Learn about the different data types in Python, such as strings, numbers, and lists.','0SJE9dYdpps', 2, 1);

INSERT INTO `user` (user_name, `password`,full_name, id_card, birthday, gender, phone, email, `role`) 
VALUES ('admin', 'admin1','Nguyễn Văn A', '124456789012', '1990-05-01', 1, '1224567890', 'joh1ndoe@email.com', 'admin');
INSERT INTO `user` (user_name, `password`,full_name, id_card, birthday, gender, phone, email, `role`) 
VALUES ('thanhpv', 'thanh123','Phạm Văn Thành', '123456789012', '1990-05-01', 1, '1234567890', 'johndoes@email.com', 'user');
INSERT INTO `user` (user_name, `password`, full_name, id_card, birthday, gender, phone, email, `role`) 
VALUES ('usertest', 'password456','Người dùng 1','098765432109', '1985-11-15', 0, '0987654321', 'jan2edoe@email.com', 'user');


INSERT INTO course_orders (order_date, order_price, user_id, course_id, order_code, `status`) 
VALUES ('2022-01-01', 24.99, 1, 1, 123456, "hoan thanh");
INSERT INTO course_orders (order_date, order_price, user_id, course_id, order_code, `status`) 
VALUES ('2022-01-02', 49.99, 1, 2, 654321, "hoan thanh");
INSERT INTO course_orders (order_date, order_price, user_id, course_id, order_code, `status`) 
VALUES ('2022-01-03', 99.99, 1, 3, 567890, "dang xu ly");