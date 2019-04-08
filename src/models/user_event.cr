class UserEvent < Granite::Base
  adapter pg
  table_name user_events

  belongs_to user : User
  belongs_to event : Event

  primary id : Int64
  timestamps
end
