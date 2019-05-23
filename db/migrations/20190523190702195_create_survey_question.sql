-- +micrate Up
CREATE TABLE survey_questions (
  id BIGSERIAL PRIMARY KEY,
  question VARCHAR,
  survey_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX survey_question_survey_id_idx ON survey_questions (survey_id);

-- +micrate Down
DROP TABLE IF EXISTS survey_questions;
