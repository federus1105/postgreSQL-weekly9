create database tickitz;

 CREATE TYPE user_role AS ENUM ('Admin', 'User');

CREATE TABLE users (
     id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
     email VARCHAR(255) NOT NULL UNIQUE,
     password VARCHAR(255) NOT NULL,
     isActive BOOLEAN,
     id_account INT,
     role user_role NOT NULL
 );

 create table account (
  id int primary key generated always as identity,
  image VARCHAR(255) NOT NULL,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  phoneNumber INT NOT NULL,
  created_at timestamp,
  update_at timestamp,
  point INT NOT NULL --
 );

  create table movies (
 id int primary key generated always as identity,
 image VARCHAR(255) NOT NULL,
 backdrop VARCHAR(255) NOT NULL,
 title VARCHAR(255) NOT NULL,
 release_date DATE NOT NULL,
 duration VARCHAR(255) NOT NULL,
 id_director INT NOT NULL,
 synopsis text NOT NULL,
 rating FLOAT NOT NULL
 );

create table actor(
id int primary key generated always as identity,
name VARCHAR(255) NOT NULL
);

 create table movies_actor(
id_movie INT NOT NULL,
id_actor INT NOT NULL
);

 create table director(
 id int primary key generated always as identity,
 name VARCHAR(255) NOT NULL
 );

 create table genres(
 id int primary key generated always as identity,
 name VARCHAR(255) NOT NULL
 );

  create table payment_method(
 id int primary key generated always as identity,
 name VARCHAR(255) NOT NULL,
 image VARCHAR(255) NOT NULL
 );

  create table location(
 id int primary key generated always as identity,
 name VARCHAR(255) NOT NULL
 );

 create table time(
id int primary key generated always as identity,
name VARCHAR(255) NOT NULL
);

 create table seats(
 id int primary key generated always as identity,
 CodeSeat VARCHAR(255) NOT NULL
 );

 create table cinema(
id int primary key generated always as identity,
name VARCHAR(255) NOT NULL,
image VARCHAR(255) NOT NULL,
price float NOT NULL
);

 create table schedule(
 id int primary key generated always as identity,
 id_movie INT NOT NULL,
 date DATE NOT NULL,
 id_cinema INT,
 id_time INT,
 id_location INT
 );

CREATE TABLE orders (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
id_schedule INT,
id_user INT,
id_payment_method INT,
total NUMERIC(10,2),
fullname VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
phone_number VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT current_timestamp,
paid BOOLEAN NOT NULL
 );

  create table movies_genre(
 id_genre INT NOT NULL,
 id_movies INT NOT NULL
 );

  create table order_seat(
 id_order INT NOT NULL,
 id_seats INT NOT NULL
 );
