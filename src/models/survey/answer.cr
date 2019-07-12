class Survey::Answer < Granite::Base
  class Stat < Granite::Base
    adapter pg

    field user_id : Int64
    field survey_response_id : Int64
    field survey_question_id : Int64
    field question : String

    select_statement <<-SQL
      SELECT
        survey_answers.id,
        survey_answers.user_id,
        survey_answers.survey_response_id,
        survey_responses.survey_question_id,
        survey_questions.question
      FROM survey_answers
      JOIN survey_responses ON survey_responses.id = survey_answers.survey_response_id
      JOIN survey_questions ON survey_questions.id = survey_responses.survey_question_id
      JOIN surveys ON surveys.id = survey_questions.survey_id
    SQL
  end

  adapter pg
  table_name survey_answers

  belongs_to :user
  belongs_to survey_response : Survey::Response, foreign_key: :survey_response_id

  primary id : Int64
  timestamps
end
