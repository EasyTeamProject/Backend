-- +micrate Up
CREATE TABLE friends (
  id BIGSERIAL PRIMARY KEY,
  from_id BIGINT,
  to_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX friend_from_id_idx ON friends (from_id);
CREATE INDEX friend_to_id_idx ON friends (to_id);

-- +micrate Down
DROP TABLE IF EXISTS friends;
