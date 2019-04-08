class Event < Granite::Base
  adapter pg
  table_name events

  primary id : Int64
  field date : Time
  field kind : Int32
  field status : Int32
  timestamps

  has_many user_events : UserEvent
  has_many users : User, through: :user_events
end
