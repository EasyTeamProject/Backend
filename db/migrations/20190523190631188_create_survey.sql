-- +micrate Up
CREATE TABLE surveys (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  event_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX survey_event_id_idx ON surveys (event_id);

-- +micrate Down
DROP TABLE IF EXISTS surveys;
