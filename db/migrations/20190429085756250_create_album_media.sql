-- +micrate Up
CREATE TABLE album_media (
  id BIGSERIAL PRIMARY KEY,
  album_id BIGINT,
  user_id BIGINT,
  storage VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX album_media_album_id_idx ON album_media (album_id);
CREATE INDEX album_media_user_id_idx ON album_media (user_id);

-- +micrate Down
DROP TABLE IF EXISTS album_media;
