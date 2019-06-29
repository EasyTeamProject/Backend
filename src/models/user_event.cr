class UserEvent < Granite::Base
  include ModelGranite

  adapter pg
  table_name user_events

  field is_admin : Bool
  primary id : Int64
  timestamps

  belongs_to user : User
  belongs_to event : Event

  def admin?
    is_admin
  end
end
