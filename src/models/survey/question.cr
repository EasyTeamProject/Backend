class Survey::Question < Granite::Base
  adapter pg
  table_name survey_questions

  belongs_to survey : Survey

  primary id : Int64
  field question : String
  timestamps
end
