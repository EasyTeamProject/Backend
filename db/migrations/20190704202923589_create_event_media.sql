-- +micrate Up
CREATE TABLE event_media (
  id BIGSERIAL PRIMARY KEY,
  event_id BIGINT,
  user_id BIGINT,
  storage VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX event_media_event_id_idx ON event_media (event_id);
CREATE INDEX event_media_user_id_idx ON event_media (user_id);

-- +micrate Down
DROP TABLE IF EXISTS event_media;
