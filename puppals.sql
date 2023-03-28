CREATE DATABASE puppals;

CREATE TABLE puppals.user (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1 NOT NULL
);

CREATE TABLE puppals.dog (
  dog_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(30) NOT NULL,
  photo VARCHAR(255) NOT NULL,
  breed VARCHAR(20) NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  date_of_birth DATE NOT NULL,
  weight INT NOT NULL,
  postal_code VARCHAR(7) NOT NULL,
  energy_level ENUM('Low', 'Moderate', 'High') NOT NULL,
  dog_owner_first_name VARCHAR(20) NOT NULL,
  profile_message VARCHAR(150) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE puppals.follow (
  follow_id INT PRIMARY KEY AUTO_INCREMENT,
  followee_dog_id INT,
  follower_dog_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (followee_dog_id) REFERENCES dog(dog_id),
  FOREIGN KEY (follower_dog_id) REFERENCES dog(dog_id)
);

CREATE TABLE puppals.chat (
  chat_id INT PRIMARY KEY AUTO_INCREMENT,
  chat_name VARCHAR(30) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1
);

CREATE TABLE puppals.message (
  message_id INT PRIMARY KEY AUTO_INCREMENT,
  dog_id INT,
  chat_id INT,
  content TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dog_id) REFERENCES dog(dog_id),
  FOREIGN KEY (chat_id) REFERENCES chat(chat_id)
);

INSERT INTO puppals.user (email, password, is_active)
VALUES 
  ('kelly.demo@gmail.com', '1234', '1'),
  ('john.demo@gmail.com', '102030', '1'),
  ('anna.demo@gmail.com', 'abcde', '1'),
  ('brian.demo@gmail.com', 'qwer', '1'),
  ('cindy.demo@gmail.com', 'asdf', '0'),
  ('dennis.demo@gmail.com', 'mnbv', '0'),
  ('emily.demo@gmail.com', 'trew', '1'),
  ('frank.demo@gmail.com', '1235', '1'),
  ('george.demo@gmail.com', '1212', '1'),
  ('harry.demo@gmail.com', '0909', '1');
  
INSERT INTO puppals.dog
  (user_id, name, photo, breed, sex, date_of_birth, weight, postal_code, energy_level, dog_owner_first_name, profile_message, is_active)
VALUES 
  ('1', 'Buncha', 'www.photostoragedemo.com', 'Maltipoo', 'M','2016-01-01', '10', 'A1B1C1', 'Low', 'Kelly','Hello there!', '1'),
  ('2', 'Oreo', 'www.photostoragedemo.com', 'Husky-mix', 'F', '2010-01-01', '60', 'A1B1C1', 'Moderate', 'John', 'Hello there!', '1'),
  ('2', 'Marika', 'www.photostoragedemo.com', 'German Sheppard', 'F', '2015-01-01', '60', 'A1B1C1', 'High', 'John', 'Hello there!', '1'),
  ('2', 'Aspasia', 'www.photostoragedemo.com', 'Beagle-mix', 'F', '2016-05-01', '30', 'A1B1C1', 'Low', 'John', 'Hello there!', '1'),
  ('3', 'Ziggy', 'www.photostoragedemo.com', 'Shih Tzu', 'F', '2017-05-01', '12', 'L1L1L1', 'Low', 'Anna', 'Hello there!', '1'),
  ('4', 'Bentley', 'www.photostoragedemo.com', 'Australian Sheppard', 'M', '2022-12-01', '30', 'A1B1C1', 'High', 'Brian', 'Hello there!', '1'),
  ('5', 'Mochi', 'www.photostoragedemo.com', 'Bichon', 'M', '2016-12-01', '15', 'M2M2M2', 'Moderate', 'Cindy', 'Hello there!', '0'),
  ('6', 'Beckam', 'www.photostoragedemo.com', 'Yorkie', 'M', '2016-04-01', '10', 'M1M1M1', 'High', 'Dennis', 'Hello there!', '0'),
  ('7', 'Mocha', 'www.photostoragedemo.com', 'Cokapoo', 'M', '2014-04-01', '30', 'M1M1M1', 'Low', 'Emily', 'Hello there!', '1'),
  ('8', 'Noonchi', 'www.photostoragedemo.com', 'Malshihpoo', 'M', '2018-04-01', '16', 'M1M1M1', 'High', 'Frank', 'Hello there!', '1'),
  ('9', 'Lola', 'www.photostoragedemo.com', 'Shihpoo', 'F', '2022-04-01', '12', 'M1M1M1', 'High', 'George', 'Hello there!', '1'),
  ('10', 'Bailey', 'www.photostoragedemo.com', 'Yorkie', 'M', '2020-04-01', '10', 'M1M1M1', 'High', 'Harry', 'Hello there!', '1'), 
  ('10', 'Brown', 'www.photostoragedemo.com', 'Husky', 'M', '2019-05-01', '40', 'M1M1M1', 'High', 'Harry', 'Hello there!', '1');
  
INSERT INTO puppals.follow (followee_dog_id, follower_dog_id)
VALUES
  ('14', '15'),
  ('14', '16'),
  ('14', '18'),
  ('15', '14'),
  ('15', '16'),
  ('15', '25'),
  ('15', '26'),
  ('16', '17'),
  ('17', '21'),
  ('18', '21'),
  ('18', '22'),
  ('19', '14'),
  ('19', '15'),
  ('19', '16'),
  ('21', '25'),
  ('22', '14'),
  ('22', '18'),
  ('23', '26'),
  ('23', '26'),
  ('24', '14'),
  ('24', '18'),
  ('25', '21'),
  ('26', '22');

  INSERT INTO puppals.chat (chat_name, is_active)
  VALUES
    ('Hyde Park Furiends', '1'),
    ('Buncha and Ziggy', '1'),
    ('Small doggos club', '1'),
    ('Big Buddies', '0');

  ALTER TABLE puppals.chat
  MODIFY COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

  ALTER TABLE puppals.message
  MODIFY COLUMN content text;

  INSERT INTO puppals.message (dog_id, chat_id, content)
  VALUES
  ('21', '1', 'hihi'),
  ('24', '1', 'hello'),
  ('19', '1', 'hi everyone'),
  ('14', '2', 'Hi Ziggy'),
  ('18', '2', 'Hi Buncha'),
  ('14', '3', 'hi everyone'),
  ('21', '3', 'hello there');

  UPDATE puppals.dog SET weight = '42' WHERE dog_id = 24;
  UPDATE puppals.user SET is_active = '0' WHERE user_id = 3;

  SELECT * FROM puppals.dog WHERE date_of_birth > '2020-01-01';
  SELECT * FROM puppals.user WHERE is_active = '0';

  INSERT INTO puppals.user (email, password, is_active)
  VALUES ('jane.demo@gmail.com', '1234', '1');
  DELETE FROM puppals.user WHERE user_id = 11;

  INSERT INTO puppals.chat (chat_name, is_active)
  VALUES ('doggie friends', '1');
  DELETE FROM puppals.chat WHERE chat_id = 5;
  
  ALTER TABLE puppals.message
  MODIFY COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
