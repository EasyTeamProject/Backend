class Message < Granite::Base
  adapter pg
  table_name messages

  belongs_to :event

  belongs_to :user

  primary id : Int64
  field content : String
  timestamps
end
