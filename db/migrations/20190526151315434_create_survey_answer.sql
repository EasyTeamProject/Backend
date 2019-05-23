-- +micrate Up
DROP TABLE IF EXISTS survey_answers;
CREATE TABLE survey_answers (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  survey_response_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX survey_answer_user_id_idx ON survey_answers (user_id);
CREATE INDEX survey_answer_survey_response_id_idx ON survey_answers (survey_response_id);

-- +micrate Down
DROP TABLE IF EXISTS survey_answers;
