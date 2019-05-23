-- +micrate Up
CREATE TABLE survey_answers (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  survey_question_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX survey_answer_user_id_idx ON survey_answers (user_id);
CREATE INDEX survey_answer_survey_question_id_idx ON survey_answers (survey_question_id);

-- +micrate Down
DROP TABLE IF EXISTS survey_answers;
