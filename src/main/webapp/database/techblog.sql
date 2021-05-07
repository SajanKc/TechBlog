CREATE DATABASE techblog;
USE techblog;

-- Creating user table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
	`uid` INT PRIMARY KEY AUTO_INCREMENT,
	`username` VARCHAR(20) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`email` VARCHAR(30) NOT NULL UNIQUE,
     `gender` VARCHAR(10) NOT NULL,
     `about` VARCHAR(255) NOT NULL DEFAULT "Hey ! I'm using techblog",
     `profile` VARCHAR(100) DEFAULT 'default.svg',
	`registered_at` TIMESTAMP DEFAULT now()
) AUTO_INCREMENT = 3;

select * from user;

drop table user;

-- Inserting data into user table
INSERT INTO user VALUES
	(1,'sajankc','1234','sazankce@gmail.com','male',default,default,default),
	(2,'munathapa','1234','muna@gmail.com','female',"My name is muna thapa. I'm using techblog",default,default);
    
-- Creating category table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `category` (
	`cat_id` INT PRIMARY KEY AUTO_INCREMENT,
	`cat_name` VARCHAR(50) NOT NULL,
	`cat_description` VARCHAR(255)
);

-- Inserting data into category table
INSERT INTO `category` VALUES 
('1', 'JAVA', 'It is one of the most popular programming language.'),
('2', 'PHP', 'It is used in 80% of websites.'),
('3', 'Database', 'It is used to store data.');

 -- Creating post table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `post` (
	`post_id` INT PRIMARY KEY AUTO_INCREMENT,
	`post_title` VARCHAR(50) NOT NULL,
	`post_content` LONGTEXT,
	`post_code` LONGTEXT,
	`post_image` VARCHAR(100),
	`post_date` TIMESTAMP DEFAULT now(),
    `user_id` INT NOT NULL,
	`cat_id` INT NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`uid`)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FOREIGN KEY (`cat_id`) REFERENCES `category`(`cat_id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)AUTO_INCREMENT = 3;

drop table post;
