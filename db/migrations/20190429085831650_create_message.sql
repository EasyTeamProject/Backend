-- +micrate Up
CREATE TABLE messages (
  id BIGSERIAL PRIMARY KEY,
  event_id BIGINT,
  user_id BIGINT,
  content VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX message_event_id_idx ON messages (event_id);
CREATE INDEX message_user_id_idx ON messages (user_id);

-- +micrate Down
DROP TABLE IF EXISTS messages;
