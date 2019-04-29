-- +micrate Up
CREATE TABLE message_media (
  id BIGSERIAL PRIMARY KEY,
  message_id BIGINT,
  storage VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX message_media_message_id_idx ON message_media (message_id);

-- +micrate Down
DROP TABLE IF EXISTS message_media;
