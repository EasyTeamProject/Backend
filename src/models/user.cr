class User < Granite::Base
  include ModelGranite

  adapter pg
  table_name users

  primary id : Int64
  field email : String
  field first_name : String
  field last_name : String
  field password : String
  timestamps

  has_many user_events : UserEvent
  has_many events : Event, through: :user_events
end
