class Album < Granite::Base
  adapter pg
  table_name albums

  belongs_to :event

  primary id : Int64
  field name : String
  timestamps
end
