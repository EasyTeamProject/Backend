class Survey < Granite::Base
  adapter pg
  table_name surveys

  belongs_to event : Event

  primary id : Int64
  field name : String

  has_many questions : Survey::Question

  timestamps
end
