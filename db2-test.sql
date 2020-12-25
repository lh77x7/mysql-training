#creating DATABASE

CREATE DATABASE `movie_management`;

USE `movie_management`;

CREATE TABLE `Studios` (
  studio_id NUMBER PRIMARY_KEY,
  name CHAR(20) UNIQUE,
  city VARCHAR2(50),
  state CHAR(2)

)

CREATE TABLE `Movies` (
  movie_title VARCHAR2(40),
  studio_id NUMBER REFERENCES Studios(studio_id)

)

CREATE TABLE `Showtimes` (
  theater_name VARCHAR2(50),
  screen CHAR(30),
  showing DATE,
  movie_title VARCHAR2(40),
  studio_id NUMBER,
  FOREIGN_KEY (theater_name, screen, showing),
  (movie_title, studio_id) REFERENCES Movies(movie_title, studio_id);

)
