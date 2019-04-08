-- +micrate Up
CREATE TABLE events (
  id BIGSERIAL PRIMARY KEY,
  date DATE,
  kind INT,
  status INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS events;
