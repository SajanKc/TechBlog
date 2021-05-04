CREATE DATABASE techblog;
USE techblog;

-- Creating user table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
	`uid` INT PRIMARY KEY AUTO_INCREMENT,
	`username` VARCHAR(20) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`email` VARCHAR(30) NOT NULL,
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