-- LOGIN
SELECT *FROM users WHERE email = 'email_input' 
AND password = 'password_input' 
AND isActive = TRUE 
AND role 'User/Admin';

-- REGISTER
INSERT INTO users(email, password, role, isActive) 
VALUES ('example.@gmail.com','example123#', 'User', true);

-- GET UPCOMING MOVIE
SELECT 
  m.id,
  m.image,
  m.title,
  STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN movies_genre mg ON m.id = mg.id_movies
JOIN genres g ON mg.id_genre = g.id
WHERE m.release_date > CURRENT_DATE
GROUP BY m.id, m.image, m.title
ORDER BY m.release_date ASC
lIMIT 20 offset 0;


-- GET POPULAR MOVIE
SELECT 
  m.id,
  m.image,
  m.title,
  m.rating,
  STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN movies_genre mg ON m.id = mg.id_movies
JOIN genres g ON mg.id_genre = g.id
WHERE m.rating >= 7
GROUP BY m.id, m.image, m.title
ORDER BY m.rating asc
lIMIT 20 offset 0;


-- GET MOVIE WITH PAGINATION
SELECT m.id, m.image, m.title, m.rating,
  STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN movies_genre mg ON m.id = mg.id_movies
JOIN genres g ON mg.id_genre = g.id
GROUP BY m.id, m.image, m.title
ORDER BY m.title asc
lIMIT 20 offset 0;


-- FILTER MOVIE BY NAME AND GENRE WITH PAGINATION
SELECT m.id, m.image, m.title, m.rating,
  STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN movies_genre mg ON m.id = mg.id_movies
JOIN genres g ON mg.id_genre = g.id
WHERE 
  LOWER(m.title) LIKE LOWER('%t%')
  AND LOWER(g.name) = LOWER('Drama')
  GROUP BY m.id, m.image, m.title
ORDER BY m.title asc
lIMIT 20 offset 0;


-- GET SCHEDULE
SELECT
  s.id,
  s.date,
  m.title AS title,
  m.image AS image,
  c.name AS cinema,
  t.name AS time,
  l.name AS location
FROM schedule s
JOIN movies m ON s.id_movie = m.id
LEFT JOIN cinema c ON s.id_cinema = c.id
LEFT JOIN time t ON s.id_time = t.id
LEFT JOIN location l ON s.id_location = l.id
ORDER BY s.date ASC;


-- GET SEAT SOLD
SELECT id, id_schedule, paid FROM orders WHERE paid = TRUE;

-- GET MOVIE DETAIL
SELECT id, image, backdrop, title, release_date, duration, id_director, synopsis
FROM movies where id = 4;


-- CREATE ORDER
INSERT INTO orders( total, fullname, email, phone_number, paid) 
    VALUES (
        'id_schedule',
        'id_payment_method',
        'total', 'fullname',
        'email', 'phone_number',
         TRUE
    );  
INSERT INTO orders ( id_schedule, id_user, id_payment_method,  total, fullname, email,  phone_number,  paid
) VALUES (3,1,                            
  2,                        
  110000.00,                   
  'Jane Doe',
  'janedoe@example.com',
  '081234567890',
  TRUE                 
);

-- GET PROFILE
SELECT 
  u.id,
  u.email,
  a.image, 
  a.firstname, 
  a.lastname, 
  a.phoneNumber
FROM users u
JOIN account a ON u.id_account = a.id;

-- GET HISTORY
SELECT
  o.id AS id_order,
  m.title AS movie_title,
  STRING_AGG(CAST(os.id_seats as VARCHAR(20)), ', ') AS seat_codes,
  COUNT(os.id_seats) AS total_seats,
  t.name AS time_name,
  o.total,
  c.name AS cinema_name,
  o.paid
FROM orders o
JOIN schedule s ON o.id_schedule = s.id
JOIN movies m ON s.id_movie = m.id
JOIN cinema c ON s.id_cinema = c.id
JOIN time t ON s.id_time = t.id
LEFT JOIN order_seat os ON o.id = os.id_order
GROUP BY o.id, m.title, t.name, o.total, c.name
ORDER BY o.created_at ASC;


-- EDIT PROFILE
UPDATE account
SET
  image = 'http://example.com/images/janedoe.jpg',
  firstname = 'Jane',
  lastname = 'Die',
  phoneNumber = '089912345678'
WHERE id = 1;


-- GET ALL MOVIE(ADMIN)
SELECT 
  m.id,
  m.title,
  STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN director d ON m.id_director = d.id
LEFT JOIN movies_genre mg ON m.id = mg.id_movies
LEFT JOIN genres g ON mg.id_genre = g.id
GROUP BY m.id, d.name
ORDER BY m.title ASC;


-- DELETE MOVIE(ADMIN)
DELETE FROM movies WHERE id = 1;

-- EDIT MOVIES(ADMIN)
UPDATE movies
SET image = 'NilaiBaru',
backdrop = "NilaiBaru",
title = "NilaiBaru",
release_date = "NilaiBaru",
duration = "NilaiBaru",
synopsis = "NilaiBaru",
rating = NilaiBaru
WHERE id = 1;