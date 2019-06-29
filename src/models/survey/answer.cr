class Survey::Answer < Granite::Base
  include ModelGranite

  adapter pg
  table_name survey_answers

  belongs_to :user
  belongs_to response : Survey::Response

  primary id : Int64
  timestamps
end
