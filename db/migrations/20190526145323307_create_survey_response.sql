-- +micrate Up
CREATE TABLE survey_responses (
  id BIGSERIAL PRIMARY KEY,
  survey_question_id BIGINT,
  text VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX survey_response_survey_question_id_idx ON survey_responses (survey_question_id);

-- +micrate Down
DROP TABLE IF EXISTS survey_responses;
