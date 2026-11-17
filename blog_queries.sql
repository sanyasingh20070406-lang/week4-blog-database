-- 1. Create Tables
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(200) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  comment_text TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert Sample Data
INSERT INTO users (username, email) VALUES ('rahul_k', 'rahul@example.com');
INSERT INTO posts (user_id, title, content) VALUES (1, 'Getting Started with Databases', 'Tables connect using foreign keys.');
INSERT INTO comments (post_id, user_id, comment_text) VALUES (1, 1, 'Very clear explanation!');

-- 3. Read Data (Fetch posts with author username)
SELECT posts.title, posts.content, users.username AS author
FROM posts
JOIN users ON posts.user_id = users.id;

-- 4. Update & Delete Data
UPDATE posts SET title = 'Database Basics Guide' WHERE id = 1;
DELETE FROM comments WHERE id = 1;
