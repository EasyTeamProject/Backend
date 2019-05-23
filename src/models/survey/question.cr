class Survey::Question < Granite::Base
  adapter pg
  table_name survey_questions

  belongs_to survey : Survey
  has_many responses : Survey::Response, foreign_key: :survey_question_id

  primary id : Int64
  field question : String
  timestamps
end
