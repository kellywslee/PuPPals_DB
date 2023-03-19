CREATE DATABASE puppals;
USE puppals;

CREATE TABLE user(
id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255) NOT NULL
);

CREATE TABLE dog(
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
dog_name VARCHAR(30) NOT NULL,
photo VARCHAR(255) NOT NULL,
breed VARCHAR(20) NOT NULL,
sex ENUM('M', 'F') NOT NULL,
date_of_birth DATE NOT NULL,
weight INT NOT NULL,
postal_code VARCHAR(7) NOT NULL,
energy_level ENUM('Low', 'Moderate', 'High') NOT NULL,
owner_first_name VARCHAR(20) NOT NULL,
profile_message VARCHAR(150),
FOREIGN KEY (user_id) REFERENCES user(id)
);
