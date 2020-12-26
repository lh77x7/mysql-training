#creating DATABASE

CREATE DATABASE `movie_management`;

USE `movie_management`;

CREATE TABLE `Studios` (
  studio_id NUMBER PRIMARY_KEY,
  studio_name CHAR(20) UNIQUE,
  studio_city VARCHAR2(50) NOT NULL,
  studio_state CHAR(2) NOT NULL

)

CREATE TABLE `People` (
  person_id NUMBER PRIMARY_KEY,
  person_fname VARCHAR2(10) NOT NULL,
  person_lname VARCHAR2(10) NOT NULL,
  person_address VARCHAR2(30),
  person_city VARCHAR2(20),
  person_state CHAR(20),
  person_zip CHAR(10),
  person_phone CHAR(10),
  person_ssn CHAR(9), UNIQUE,
  person_union CHAR(1) DEFAULT 'y',

)

CREATE TABLE `Movies` (
  movie_id NUMBER,
  movie_title VARCHAR2(20),
  studio_id NUMBER REFERENCES Studios(studio_id),
  director_id NUMBER REFERENCES People (czlowiek_id),
  gross NUMBER,
  budget NUMBER,
  release_date DATE,
  PRIMARY_KEY (movie_id),
  UNIQUE (movie_title, studio_id),
  CONSTRAINT gross_constraint,
  CHECK (gross < 1000),
  CONSTRAINT budget_constraint,
  CHECK (budget < 200)

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

CREATE TABLE `Cast_Movies` (
  movie_id NUMBER REFERENCES Movies(movie_id),
  person_id NUMBER REFERENCES People(person_id),
  role VARCHAR2(30),
  payment NUMBER,
  PRIMARY_KEY (movie_id, person_id),
  CONSTRAINT minimum_pay
  CHECK (payment > 500)

)

CREATE TABLE `Locations` (
  movie_id NUMBER REFERENCES Movies(movie_id),
  city VARCHAR2(20),
  state CHAR(2),
  PRIMARY_KEY (movie_id, city, state)

)
