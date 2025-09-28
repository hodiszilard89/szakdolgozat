-- 1. type_of_news
INSERT INTO type_of_news (id, title) VALUES
(1, 'BELFÖLD'),
(2, 'KÜLFÖLD'),
(3, 'KULTÚRA'),
(4, 'SPORT'),
(5, 'POLITIKA'),
(6, 'GAZDASÁG'),
(7, 'INFORMATIKA');

-- 2. roles
INSERT INTO roles (id, title) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'WRITER');

-- 3. users
INSERT INTO users (id, chat_name, email, first_name, image_path, locked, password, sec_name) VALUES
(1, 'Admin1234', 'iamadmin@gmail.com', 'Admin', './uploads/image.jpeg', 0, 'admin1234', 'Ádám'),
(2, 'irobela', 'irobela@gmail.com', 'Író', './uploads/2024_11_29_23_38_05.jpeg', 0, 'irobela1234', 'Béla'),
(8, 'irokálmán', 'irokalman@gmail.com', 'Író', './uploads/2024_11_29_23_38_35.jpeg', 0, 'irokalman1234', 'Kálmán'),
(26, 'IroAttila', 'iroAttila@gmail.com', 'Iro', './uploads/2024_11_29_23_38_56.jpeg', 0, 'iroattila', 'Attila');

-- 4. user_roles
INSERT INTO user_roles (roles_id, users_id) VALUES
(1, 1),
(3, 2),
(3, 8),
(2, 8),
(2, 26),
(3, 26);

-- 5. news
INSERT INTO news (id, img_path, priority, releasedate, subtitle, text, title, users_id) VALUES
(3, 'https://assets.4cdn.hu/kraken/87r3wmDQkizf1Ieqvs-md.jpeg', 0, '2024-11-29 17:47:49', 'Alekszej Navalnij...', 'A zavarba ejtően ismerősen hangzó...', 'Nem bírta tétlenül...', 1),
(5, 'https://s.24.hu/app/uploads/...1140x641.jpg', 0, '2024-11-29 17:55:12', 'A Nemzeti Választási...', 'A Nemzeti Választási Bizottság...', 'Megtámadták a Kúrián...', 1),
(6, 'https://s.24.hu/app/uploads/...1140x640.jpg', 0, '2024-11-29 18:03:46', 'Nagy Márton nemzetgazdasági...', 'Hosszú hétvégék 2025-ben...', 'Öt hosszú hétvége jön...', 2),
(7, 'https://s.24.hu/app/uploads/...1140x641.jpg', 1, '2024-11-29 19:33:07', 'Fülöp Attila a Belügyminisztérium...', 'Fülöp Attila szerint „megengedhetetlen...”', '„Ez példa nélküli...”', 2),
(9, 'https://s.24.hu/app/uploads/...1140x643.jpg', 1, '2024-11-29 19:47:34', 'Magyar Péter pénteken...', 'Magyar Péter pénteken...', 'Magyar Pétert nem engedték be...', 8),
(10, 'https://cdn.nemzetisport.hu/.../dupla.jpg', 0, '2024-11-29 19:55:40', 'Cristiano Ronaldo...', 'A pénteki korai meccsen...', 'Cristiano Ronaldo duplázott...', 8);

-- 6. comment
INSERT INTO comment (id, release_date, text, news_id, writer_id) VALUES
(4, '2024-11-29 17:48:18', 'Nagyon hasznos cikk', 3, 1);

-- 7. news_type
INSERT INTO news_type (news_id, type_id) VALUES
(3, 2),
(5, 1),
(5, 5),
(6, 3),
(7, 1),
(9, 1),
(9, 5),
(10, 4);

-- 8. user_news_likes
INSERT INTO user_news_likes (news_id, users_id) VALUES
(3, 1);
