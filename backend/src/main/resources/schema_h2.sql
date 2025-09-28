DROP TABLE IF EXISTS user_news_likes;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users_comment;
DROP TABLE IF EXISTS news_type;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS type_of_news;
DROP TABLE IF EXISTS users;

CREATE TABLE comment (
  id BIGINT PRIMARY KEY,
  release_date TIMESTAMP,
  text CLOB,
  news_id BIGINT,
  writer_id BIGINT
);

CREATE TABLE news (
  id BIGINT PRIMARY KEY,
  img_path CLOB,
  priority BOOLEAN,
  releasedate TIMESTAMP,
  subtitle VARCHAR(255),
  text CLOB,
  title VARCHAR(255),
  users_id BIGINT
);

CREATE TABLE news_type (
  news_id BIGINT,
  type_id BIGINT,
  PRIMARY KEY (news_id, type_id)
);

CREATE TABLE roles (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE type_of_news (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE users (
  id BIGINT PRIMARY KEY,
  chat_name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  first_name VARCHAR(255),
  image_path VARCHAR(255),
  locked BOOLEAN,
  password VARCHAR(255),
  sec_name VARCHAR(255)
);

CREATE TABLE users_comment (
  users_id BIGINT,
  comment_id BIGINT UNIQUE
);

CREATE TABLE user_news_likes (
  news_id BIGINT,
  users_id BIGINT,
  PRIMARY KEY (news_id, users_id)
);

CREATE TABLE user_roles (
  roles_id BIGINT,
  users_id BIGINT
);

-- Foreign keys (H2 kompatibilis)

-- comment
ALTER TABLE comment
  ADD FOREIGN KEY (writer_id) REFERENCES users(id);

ALTER TABLE comment
  ADD FOREIGN KEY (news_id) REFERENCES news(id);

-- news
ALTER TABLE news
  ADD FOREIGN KEY (users_id) REFERENCES users(id);

-- news_type
ALTER TABLE news_type
  ADD FOREIGN KEY (news_id) REFERENCES news(id);

ALTER TABLE news_type
  ADD FOREIGN KEY (type_id) REFERENCES type_of_news(id);

-- users_comment
ALTER TABLE users_comment
  ADD FOREIGN KEY (users_id) REFERENCES users(id);

ALTER TABLE users_comment
  ADD FOREIGN KEY (comment_id) REFERENCES comment(id);

-- user_news_likes
ALTER TABLE user_news_likes
  ADD FOREIGN KEY (news_id) REFERENCES news(id);

ALTER TABLE user_news_likes
  ADD FOREIGN KEY (users_id) REFERENCES users(id);

-- user_roles
ALTER TABLE user_roles
  ADD FOREIGN KEY (roles_id) REFERENCES roles(id);

ALTER TABLE user_roles
  ADD FOREIGN KEY (users_id) REFERENCES users(id);
