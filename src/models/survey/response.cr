class Survey::Response < Granite::Base


  adapter pg
  table_name survey_responses

  belongs_to survey_question : Survey::Question, foreign_key: :survey_question_id

  primary id : Int64
  field text : String
  timestamps
end
