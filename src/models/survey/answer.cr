class Survey::Answer < Granite::Base
  adapter pg
  table_name survey_answers

  belongs_to :user
  belongs_to survey_response : Survey::Response, foreign_key: :survey_response_id

  primary id : Int64
  timestamps
end
