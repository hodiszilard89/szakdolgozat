-- schema.sql - MySQL kompatibilis tábladefiníciók

-- 1. type_of_news
CREATE TABLE type_of_news (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

-- 2. roles
CREATE TABLE roles (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

-- 3. users
CREATE TABLE users (
  id BIGINT PRIMARY KEY,
  chat_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  image_path VARCHAR(500),
  locked BOOLEAN,
  password VARCHAR(255) NOT NULL,
  sec_name VARCHAR(255)
);

-- 4. user_roles (kapcsolótábla)
CREATE TABLE user_roles (
  roles_id BIGINT,
  users_id BIGINT,
  PRIMARY KEY (roles_id, users_id),
  FOREIGN KEY (roles_id) REFERENCES roles(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

-- 5. news
CREATE TABLE news (
  id BIGINT PRIMARY KEY,
  img_path VARCHAR(500),
  priority INT,
  releasedate TIMESTAMP,
  subtitle VARCHAR(500),
  text TEXT,
  title VARCHAR(500),
  users_id BIGINT,
  FOREIGN KEY (users_id) REFERENCES users(id)
);

-- 6. comment
CREATE TABLE comment (
  id BIGINT PRIMARY KEY,
  release_date TIMESTAMP,
  text TEXT,
  news_id BIGINT,
  writer_id BIGINT,
  FOREIGN KEY (news_id) REFERENCES news(id),
  FOREIGN KEY (writer_id) REFERENCES users(id)
);

-- 7. news_type (kapcsolótábla)
CREATE TABLE news_type (
  news_id BIGINT,
  type_id BIGINT,
  PRIMARY KEY (news_id, type_id),
  FOREIGN KEY (news_id) REFERENCES news(id),
  FOREIGN KEY (type_id) REFERENCES type_of_news(id)
);

-- 8. user_news_likes (kapcsolótábla)
CREATE TABLE user_news_likes (
  news_id BIGINT,
  users_id BIGINT,
  PRIMARY KEY (news_id, users_id),
  FOREIGN KEY (news_id) REFERENCES news(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);
