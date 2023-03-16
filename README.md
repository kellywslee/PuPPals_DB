# PupPals - Database Design
YorkU Full Stack Program FS1030 Project

## Find doggie playdates at PupPals!
PupPals is a social platform designed to connect dog owners and their dogs for playdates. Users can easily search and browse profiles of other dogs in their area, including their photo, name, breed, size, age, and energy level, making it easy to find the perfect playdate match for their dogs. They can also add other dogs to their friend list and message them directly to schedule playdates.

## Figma Design Link:
https://www.figma.com/file/HaMJbXliECEywGZ3WAd5gr/PupPals?node-id=0%3A1&t=JVUmwWMKJY4v9ocW-1

## Mission Statement
The purpose of PupPals’s database is to gather information from dog owners and generate profiles of their dogs and make it available to other users of the app so that they can find suitable playdates for their dogs.

## Mission Objectives
- Allow users to create, manage, and update their dogs’ profiles
- Allow users to browse and search other dogs' profiles
- Provide tools for adding other dogs to a friend list
- Enable users to send and receive messages to other dog owners within the app

## Entity Relationship Model
Entities:
- User
- Dog
- Friendship
- Message

Relationships:
- A user may have one or more dogs; A dog must belong to one and only one user.
- A dog may follow one or more dogs; A dog may be followed by one or more dogs.
- A user may send one or more messages; A message must belong to one and only one User


## Entity Relationship Diagram
https://drive.google.com/file/d/1sFVd3-d_lQrg-h3j8s8BaAiOUOWf7GaC/view?usp=sharing
![image](https://user-images.githubusercontent.com/76071382/225703088-9228a4d1-308a-49df-995c-8ab15fb6bbae.png)


## Relational Model
1. user: user_id(pk), email, password, signup_date, account_status
2. dog_profile: dog_id(pk), user_id(fk), dog_name, breed, sex, date_of_birth, weight, energy_level, dog_owner_first_name, profile_message, dog_profile_status
3. friendship: followee_dog_id(fk), follower_dog_id(fk)
4. message: message_id(pk), sender_dog_id(fk), receiver_dog_id(fk), message_text, timestamp
