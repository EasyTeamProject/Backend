-- +micrate Up
CREATE TABLE user_events (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  event_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX user_event_user_id_idx ON user_events (user_id);
CREATE INDEX user_event_event_id_idx ON user_events (event_id);

-- +micrate Down
DROP TABLE IF EXISTS user_events;
