class Event < Granite::Base
  class Membership < Granite::Base
    adapter pg

    # field id : Int64
    field user_id : Int64
    field event_id : Int64

    field first_name : String
    field last_name : String

    field is_admin : Bool
    field invitation_date : Time

    select_statement <<-SQL
      SELECT
        user_events.id,
        user_events.user_id,
        user_events.event_id,
        users.first_name,
        users.last_name,
        user_events.is_admin,
        user_events.created_at as invitation_date
      FROM user_events
      JOIN users
      ON users.id = user_events.user_id
    SQL
  end

  include ModelGranite

  adapter pg
  table_name events

  primary id : Int64
  field name : String
  field date : Time
  field subject : String
  field information : String
  timestamps

  def members
    Membership.all("WHERE event_id = #{id}").to_a
  end

  has_many user_events : UserEvent
  has_many users : User, through: :user_events
end
