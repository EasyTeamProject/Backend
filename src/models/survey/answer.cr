class Survey::Answer < Granite::Base
  adapter pg
  table_name survey_answers

  belongs_to :user
  belongs_to survey_question : SurveyQuestion

  primary id : Int64
  timestamps
end
