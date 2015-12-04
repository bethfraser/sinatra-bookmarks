DROP TABLE bookmarks;
CREATE TABLE bookmarks (
  id SERIAL8 primary key,
  name VARCHAR(255),
  url text not null,
  category VARCHAR(255)
);
