CREATE DATABASE puppals;

CREATE TABLE puppals.user (
  user_id INT AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1 NOT NULL,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE puppals.dog (
  dog_id INT AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  photo VARCHAR(255) NOT NULL,
  breed VARCHAR(40) NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  date_of_birth DATE NOT NULL,
  weight INT NOT NULL,
  postal_code VARCHAR(7) NOT NULL,
  energy_level ENUM('Low', 'Moderate', 'High') NOT NULL,
  dog_owner_first_name VARCHAR(20) NOT NULL,
  profile_message VARCHAR(200) NOT NULL DEFAULT 'Hello',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1 NOT NULL,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (dog_id),
  CONSTRAINT fk_dog_user_id
  FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE puppals.follow (
  follow_id INT AUTO_INCREMENT,
  followee_dog_id INT NOT NULL,
  follower_dog_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (follow_id),
  CONSTRAINT fk_follow_followee_dog_id
  FOREIGN KEY (followee_dog_id) REFERENCES dog(dog_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_follow_follower_dog_id
  FOREIGN KEY (follower_dog_id) REFERENCES dog(dog_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE puppals.chat (
  chat_id INT AUTO_INCREMENT,
  chat_name VARCHAR(30) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (chat_id)
);

CREATE TABLE puppals.chat_participant (
  chat_participant_id INT AUTO_INCREMENT,
  dog_id INT,
  chat_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (chat_participant_id),
  CONSTRAINT fk_chat_participant_dog_id
  FOREIGN KEY (dog_id) REFERENCES dog(dog_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_chat_participant_chat_id
  FOREIGN KEY (chat_id) REFERENCES chat(chat_id) ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE (dog_id, chat_id)
);

CREATE TABLE puppals.message (
  message_id INT AUTO_INCREMENT,
  dog_id INT,
  chat_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  PRIMARY KEY (message_id),
  CONSTRAINT fk_message_dog_id
  FOREIGN KEY (dog_id) REFERENCES dog(dog_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_message_chat_id
  FOREIGN KEY (chat_id) REFERENCES chat(chat_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO puppals.user (email, password, is_active)
VALUES 
  ('kelly.demo@gmail.com', '1234', 1),
  ('john.demo@gmail.com', '102030', 1),
  ('anna.demo@gmail.com', 'abcde', 1),
  ('brian.demo@gmail.com', 'qwer', 1),
  ('cindy.demo@gmail.com', 'asdf', 0),
  ('dennis.demo@gmail.com', 'mnbv', 0),
  ('emily.demo@gmail.com', 'trew', 1),
  ('frank.demo@gmail.com', '1235', 1),
  ('george.demo@gmail.com', '1212', 1),
  ('harry.demo@gmail.com', '0909', 1);

INSERT INTO puppals.dog
  (user_id, name, photo, breed, sex, date_of_birth, weight, postal_code, energy_level, dog_owner_first_name, profile_message, is_active)
VALUES 
  (1, 'Buncha', 'www.photostoragedemo.com', 'Maltipoo', 'M','2016-01-01', '10', 'M5V2Y6', 'Low', 'Kelly','Hello there!', 1),
  (2, 'Oreo', 'www.photostoragedemo.com', 'Husky-mix', 'F', '2010-01-01', '60', 'M6K1G4', 'Moderate', 'John', 'Hello there!', 1),
  (2, 'Marika', 'www.photostoragedemo.com', 'German Sheppard', 'F', '2015-01-01', '60', 'M6K1G4', 'High', 'John', 'Hello there!', 1),
  (2, 'Aspasia', 'www.photostoragedemo.com', 'Beagle-mix', 'F', '2016-05-01', '30', 'M5T2R8', 'Low', 'John', 'Hello there!', 1),
  (3, 'Ziggy', 'www.photostoragedemo.com', 'Shih Tzu', 'F', '2017-05-01', '12', 'M6G2M9', 'Low', 'Anna', 'Hello there!', 1),
  (4, 'Bentley', 'www.photostoragedemo.com', 'Australian Sheppard', 'M', '2022-12-01', '30', 'M5B2H6', 'High', 'Brian', 'Hello there!', 1),
  (5, 'Mochi', 'www.photostoragedemo.com', 'Bichon', 'M', '2016-12-01', '15', 'M2N7E9', 'Moderate', 'Cindy', 'Hello there!', 0),
  (6, 'Beckam', 'www.photostoragedemo.com', 'Yorkie', 'M', '2016-04-01', '10', 'M5J2X5', 'High', 'Dennis', 'Hello there!', 0),
  (7, 'Mocha', 'www.photostoragedemo.com', 'Cokapoo', 'M', '2014-04-01', '30', 'M5V3L8', 'Low', 'Emily', 'Hello there!', 1),
  (8, 'Noonchi', 'www.photostoragedemo.com', 'Malshihpoo', 'M', '2018-04-01', '16', 'M4W0A8', 'High', 'Frank', 'Hello there!', 1),
  (9, 'Lola', 'www.photostoragedemo.com', 'Shihpoo', 'F', '2022-04-01', '12', 'M5A1L4', 'High', 'George', 'Hello there!', 1),
  (10, 'Bailey', 'www.photostoragedemo.com', 'Yorkie', 'M', '2020-04-01', '10', 'M5R2P1', 'High', 'Harry', 'Hello there!', 1), 
  (10, 'Brown', 'www.photostoragedemo.com', 'Husky', 'M', '2019-05-01', '40', 'M5RSP1', 'High', 'Harry', 'Hello there!', 1);

INSERT INTO puppals.follow (followee_dog_id, follower_dog_id)
VALUES
  (1, 5),
  (1, 6),
  (1, 8),
  (2, 1),
  (2, 6),
  (2, 5),
  (3, 1),
  (4, 1),
  (5, 2),
  (5, 3),
  (5, 10),
  (6, 1),
  (6, 11),
  (7, 11),
  (7, 8),
  (8, 2),
  (8, 12),
  (9, 13),
  (9, 12),
  (10, 4),
  (11, 1),
  (12, 10),
  (13, 10);

INSERT INTO puppals.chat (chat_name)
VALUES
  ('Hyde Park Furiends'),
  ('Buncha and Ziggy'),
  ('Small doggos club'),
  ('Big Buddies');

INSERT INTO puppals.chat_participant (dog_id, chat_id)
VALUES
  (11, 1),
  (12, 1),
  (3, 1),
  (1, 2),
  (5, 2),
  (4, 3),
  (10, 3);

INSERT INTO puppals.message (dog_id, chat_id, content)
VALUES
  (11, 1, 'hihi'),
  (12, 1, 'hello'),
  (3, 1, 'hi everyone'),
  (1, 2, 'Hi Ziggy'),
  (5, 2, 'Hi Buncha'),
  (4, 3, 'hi everyone'),
  (10, 3, 'hello there');


-- Inserting Extra Data

INSERT INTO puppals.user (email, password)
VALUES ('dorothy.demo@gmail.com', 'mypassword');

INSERT INTO puppals.dog (user_id, name, photo, breed, sex, date_of_birth, weight, postal_code, energy_level, dog_owner_first_name, profile_message)
VALUES (11, 'Miska', 'www.photostoragedemo.com', 'Husky', 'M', '2015-05-01', '60', 'M5A1T7', 'Low', 'Dorothy', 'Hello there!');

INSERT INTO puppals.follow (followee_dog_id, follower_dog_id)
VALUES
  (14, 5);

INSERT INTO puppals.chat (chat_name)
VALUES
  ('Go Huskies');

INSERT INTO puppals.chat_participant (dog_id, chat_id)
VALUES
  (14, 5),
  (13, 5),
  (10, 5);

INSERT INTO puppals.message (dog_id, chat_id, content)
VALUES
  (14, 5, 'Hello, My name is Miska'),
  (13, 5, 'Hello, Miska'),
  (10, 5, 'Whoops! I am not a Husky'),
  (13, 5, 'You are still welcomed'),
  (13, 5, 'abcde');

-- Updating data

UPDATE puppals.dog SET weight = '62' WHERE dog_id = 14;
UPDATE puppals.chat SET chat_name = 'Gogogo Huskies' WHERE chat_id = 5;

-- To deleted a message (Soft Delete)

UPDATE puppals.message SET is_deleted = 1 WHERE message_id = 12;

-- To delete a dog (Soft Delete)

UPDATE puppals.dog SET is_deleted = 1 WHERE dog_id = 14;

-- To leave a chat

UPDATE puppals.chat_participant SET is_deleted = 1 WHERE chat_participant_id = 10;

-- To display playdates by weight (between 10 - 20 lb)

SELECT 
  d.name AS "Dog Name",  
  d.photo AS "Photo",
  d.breed AS "Breed",  
  d.sex AS "Sex",
  TIMESTAMPDIFF(YEAR, d.date_of_birth, NOW()) -
  CASE
    WHEN MONTH(d.date_of_birth) > MONTH(NOW()) OR
         (MONTH(d.date_of_birth) = MONTH(NOW()) AND DAY(d.date_of_birth) > DAY(NOW()))
    THEN 1
    ELSE 0
  END AS "Age",
  d.weight AS "Weight(lb)",
  d.postal_code AS "Postal Code",
  d.energy_level AS "Energy Level",
  d.dog_owner_first_name AS "Pawrent's Name",
  d.profile_message AS "Message"
FROM puppals.dog AS d
WHERE
  d.weight BETWEEN 10 AND 20 AND
  d.is_active = 1
ORDER BY d.weight;

-- To display playdates by weight & Age (Under 15 lb and less than 2 years old)

SELECT 
  d.name AS "Dog Name",  
  d.photo AS "Photo",
  d.breed AS "Breed",  
  d.sex AS "Sex",
  TIMESTAMPDIFF(YEAR, d.date_of_birth, NOW()) -
  CASE
    WHEN MONTH(d.date_of_birth) > MONTH(NOW()) OR
         (MONTH(d.date_of_birth) = MONTH(NOW()) AND DAY(d.date_of_birth) > DAY(NOW()))
    THEN 1
    ELSE 0
  END AS "Age",
  d.weight AS "Weight(lb)",
  d.postal_code AS "Postal Code",
  d.energy_level AS "Energy Level",
  d.dog_owner_first_name AS "Pawrent's Name",
  d.profile_message AS "Message"
FROM puppals.dog AS d
WHERE
  d.weight < 15 AND
  d.is_active = 1 AND
  TIMESTAMPDIFF(YEAR, d.date_of_birth, NOW()) -
  CASE
    WHEN MONTH(d.date_of_birth) > MONTH(NOW()) OR
         (MONTH(d.date_of_birth) = MONTH(NOW()) AND DAY(d.date_of_birth) > DAY(NOW()))
    THEN 1
    ELSE 0
  END < 2;

-- To find the most followed dog and count # of followers

SELECT
  d.name AS "Dog Name",
  COUNT(f.follower_dog_id) AS "Number of Followers"
FROM puppals.dog AS d
JOIN puppals.follow AS f 
  ON d.dog_id = f.followee_dog_id
WHERE f.is_deleted = 0
GROUP BY d.dog_id, d.name
ORDER BY COUNT(f.follower_dog_id) DESC
LIMIT 1;

-- To find the heaviest dog

SELECT
  d.name AS "Dog Name",
  d.weight AS "Weight"
FROM puppals.dog AS d
WHERE d.weight = (SELECT MAX(weight) FROM puppals.dog);

-- To find the number of participants for each chat room (LEFT JOIN to display chats with 0 participants)

SELECT 
  c.chat_name AS "Chat Name",
  COUNT(cp.dog_id) AS "Number of Chat Participants"
FROM puppals.chat AS c
LEFT JOIN puppals.chat_participant AS cp
  ON cp.chat_id = c.chat_id
GROUP BY c.chat_id, c.chat_name;

-- To find the chat rooms with more than 2 messages

SELECT
  c.chat_name AS "Chat Name",
  COUNT(DISTINCT m.message_id) AS "Number of Messages",
  COUNT(DISTINCT cp.dog_id) AS "Number of Chat Participants"
FROM puppals.chat AS c
JOIN puppals.message AS m
  ON c.chat_id = m.chat_id
JOIN puppals.chat_participant AS cp
  ON c.chat_id = cp.chat_id
GROUP BY c.chat_id, c.chat_name
HAVING COUNT(DISTINCT m.message_id) > 2;

-- To show all the chat activities

SELECT
  c.chat_name AS "Chat Rooms",
  CASE
    WHEN d.is_deleted = 1 THEN 'Deleted dog' -- when a dog is deleted, it shows "Deleted dog"
    ELSE d.name
  END AS "Dog Name",
  CASE
    WHEN m.is_deleted = 1 THEN 'Deleted message' -- when a message is deleted, it shows "Deleted message"
    ELSE m.content
  END AS "Message",
  m.created_at AS "Sent at",
  cp.created_at AS "Joined Chat",
  CASE
    WHEN cp.is_deleted = 1 OR d.is_deleted = 1 THEN cp.updated_at -- leaving a chat
    ELSE NULL
  END AS "Left Chat"
FROM puppals.chat AS c
JOIN puppals.message AS m
  ON c.chat_id = m.chat_id
JOIN puppals.dog AS d
  ON m.dog_id = d.dog_id
JOIN puppals.chat_participant AS cp
  ON cp.dog_id = d.dog_id AND cp.chat_id = c.chat_id;

-- Admin user option

ALTER TABLE puppals.user
ADD COLUMN is_admin TINYINT(1) DEFAULT 0 NOT NULL;


