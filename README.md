# PupPals - Database Design
YorkU Full Stack Program FS1030 Project

## Find doggie playdates at PupPals!
PupPals is a social platform designed to connect dog owners and their dogs for playdates. Users can easily search and browse profiles of other dogs in their area, including their photo, name, breed, size, age, and energy level, making it easy to find the perfect playdate match for their dogs. They can also add other dogs to their friend list and message them directly to schedule playdates.

## Figma Design Link:
https://www.figma.com/file/HaMJbXliECEywGZ3WAd5gr/PupPals?node-id=0%3A1&t=JVUmwWMKJY4v9ocW-1
![Screenshot 2023-03-16 135525](https://user-images.githubusercontent.com/76071382/227738179-431f3161-f2de-4acd-b769-636fcacbcc51.png)

## Mission Statement
The purpose of PupPals’s database is to gather information from dog owners and generate profiles of their dogs and make it available to other users of the app so that they can find suitable playdates for their dogs.

## Mission Objectives
- Allow users to create, manage, and update their dogs’ profiles
- Allow users to browse and search other dogs' profiles
- Provide tools for following other dogs
- Enable users to send and receive messages to/from other dog owners within the app

## Entity Relationship Model
Entities:
- User
- Dog
- Follow
- Message
- Chat

Relationships:
- A user may have one or more dogs; A dog must belong to one and only one user.
- A dog may follow one or more dogs; A dog may be followed by one or more dogs.
- A dog may send one or more messages; A message must belong to one and only one dog.
- A chat may have one or more messages; A message must belong to one and only one chat.

## Entity Relationship Diagram
https://drive.google.com/file/d/1sFVd3-d_lQrg-h3j8s8BaAiOUOWf7GaC/view?usp=sharing
![image](https://user-images.githubusercontent.com/76071382/227822009-d73c7bb6-367f-4aa7-8cdc-c0eef958e43d.png)

## Relational Model
- **user** (user_id(pk), email, password, created_at, updated_at, is_active)
- **dog** (dog_id(pk), user_id(fk), name, photo, breed, sex, date_of_birth, weight, postal_code, energy_level, dog_owner_first_name, profile_message, created_at, updated_at, is_active)
- **follow** (follow_id(pk), followee_dog_id(fk), follower_dog_id(fk), created_at, updated_at)
- **chat** (chat_id (pk), chat_name, created_at, updated_at, is_active)
- **message** (message_id (pk), dog_id (fk), chat_id (fk), content, created_at)


