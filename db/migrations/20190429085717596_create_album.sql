-- +micrate Up
CREATE TABLE albums (
  id BIGSERIAL PRIMARY KEY,
  event_id BIGINT,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX album_event_id_idx ON albums (event_id);

-- +micrate Down
DROP TABLE IF EXISTS albums;
