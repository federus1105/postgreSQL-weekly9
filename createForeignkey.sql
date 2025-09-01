-- ADD FOREING KEY IN TABLE MOVIES
ALTER TABLE movies ADD FOREIGN KEY (id_director) REFERENCES director(id);

-- ADD FOREING KEY IN TABLE MOVIES_GENRE
ALTER TABLE movies_genre ADD FOREIGN KEY (id_genre) REFERENCES genres(id);
ALTER TABLE movies_genre ADD FOREIGN KEY (id_movies) REFERENCES movies(id);

--ADD FOREING KEY IN TABLE MOVIES_ACTOR
ALTER TABLE movies_actor ADD FOREIGN KEY (id_movie) REFERENCES movies(id);
ALTER TABLE movies_actor ADD FOREIGN KEY (id_actor) REFERENCES actor(id);

-- ADD FOREING KEY IN TABLE SCHEDULE
ALTER TABLE schedule ADD FOREIGN KEY (id_movie) REFERENCES movies(id);
ALTER TABLE schedule ADD FOREIGN KEY (id_cinema) REFERENCES cinema(id);
ALTER TABLE schedule ADD FOREIGN KEY (id_time) REFERENCES time(id);
ALTER TABLE schedule ADD FOREIGN KEY (id_location) REFERENCES location(id);

-- ADD FOREING KEY IN TABLE ORDERS
ALTER TABLE orders ADD FOREIGN KEY (id_user) REFERENCES users(id);
ALTER TABLE orders ADD FOREIGN KEY (id_payment_method) REFERENCES payment_method(id);
ALTER TABLE orders ADD FOREIGN KEY (id_payment_method) REFERENCES payment_method(id);

-- ADD FOREING KEY IN TABLE ORDER_SEAT
ALTER TABLE order_seat ADD FOREIGN KEY (id_order) REFERENCES orders(id);
ALTER TABLE order_seat ADD FOREIGN KEY (id_seats) REFERENCES seats(id);

-- ADD FOREING KEY IN TABLE USER
ALTER TABLE users ADD FOREIGN KEY (id_account) REFERENCES account(id);