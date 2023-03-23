# PupPals - Database Design
YorkU Full Stack Program FS1030 Project

## Find doggie playdates at PupPals!
PupPals is a social platform designed to connect dog owners and their dogs for playdates. Users can easily search and browse profiles of other dogs in their area, including their photo, name, breed, size, age, and energy level, making it easy to find the perfect playdate match for their dogs. They can also add other dogs to their friend list and message them directly to schedule playdates.

## Figma Design Link:
https://www.figma.com/file/HaMJbXliECEywGZ3WAd5gr/PupPals?node-id=0%3A1&t=JVUmwWMKJY4v9ocW-1
![image](https://user-images.githubusercontent.com/76071382/225710049-c8625361-16c6-4eef-90e8-c2878fcdefd0.png)

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
- Chat
- Chat_Participants
- Message

Relationships:
- A user may have one or more dogs; A dog must belong to one and only one user.
- A dog may follow one or more dogs; A dog may be followed by one or more dogs.
- A chat may have two or more participants; A dog may participate in one or more chats.
- A chat may have one or more messages; A message must belong to one and only one chat.

## Entity Relationship Diagram
https://drive.google.com/file/d/1sFVd3-d_lQrg-h3j8s8BaAiOUOWf7GaC/view?usp=sharing
![image](https://user-images.githubusercontent.com/76071382/225780728-df1d7db1-b2fd-4dee-b651-1a140d5d16f3.png)

## Relational Model
- **user** (user_id(pk), email, password, created_at, updated_at, is_active)
- **dog** (dog_id(pk), user_id(fk), dog_name, photo, breed, sex, date_of_birth, weight, postal_code, dog_owner_first_name, energy_level, profile_message, created_at, updated_at, is_active)
- **friendship** (followee_dog_id(fk), follower_dog_id(fk), created_at, updated_at)
- **chat** (chat_id (pk), chat_name, is_active, created_at)
- **chat_participants** (chat_id (fk), dog_id (fk))
- **message** (message_id (pk), chat_id (fk), sender_dog_id (fk), message_text, created_at)
