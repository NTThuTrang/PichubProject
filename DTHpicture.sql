CREATE DATABASE dthpicture;
USE dthpicture;

CREATE TABLE users (
  userID int(5) NOT NULL  primary key AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE list(
listID int(5) NOT NULL primary key AUTO_INCREMENT,
listName varchar(50) NOT NULL
);

CREATE TABLE image(
imageID int(5) NOT NULL primary key AUTO_INCREMENT,
imageName varchar(50) NOT NULL,
imageFile varchar(200) NOT NULL,
description varchar(400),
userID int(5) NOT NULL,
CONSTRAINT fk_image_user FOREIGN KEY(userID) REFERENCES users(userID) ON UPDATE CASCADE
);


CREATE TABLE imageList (
  listId int(5) NOT NULL,
  imageID int(5) NOT NULL,
   CONSTRAINT fk_imageList_List FOREIGN KEY(listID) REFERENCES list(listID) ON UPDATE CASCADE,
  CONSTRAINT fk_imageList_image FOREIGN KEY(imageID) REFERENCES image(imageID) ON UPDATE CASCADE
 );

CREATE TABLE comments (
  commentId int(11) NOT NULL primary key AUTO_INCREMENT ,
  imageID int(5) NOT NULL,
  userID int(5) NOT NULL,
  content varchar(500) NOT NULL,
  CONSTRAINT fk_comments_users FOREIGN KEY(userID) REFERENCES users(userID) ON UPDATE CASCADE,
  CONSTRAINT fk_comments_image FOREIGN KEY(imageID) REFERENCES image(imageID) ON UPDATE CASCADE
  );


CREATE TABLE tags (
  tagID int(5) NOT NULL primary key AUTO_INCREMENT,
  tagName varchar(50) NOT NULL
);

CREATE TABLE tags_image (
  tagId int(5) NOT NULL,
  imageID int(5) NOT NULL,
   CONSTRAINT fk_tags_image_tags FOREIGN KEY(tagID) REFERENCES tags(tagID) ON UPDATE CASCADE,
  CONSTRAINT fk_tags_image_image FOREIGN KEY(imageID) REFERENCES image(imageID) ON UPDATE CASCADE
 );
