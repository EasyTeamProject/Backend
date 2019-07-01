module Models
  class Event < Jennifer::Model::Base
    with_timestamps

    mapping(
      id: Primary64,
      name: String?,
      date: Time?,
      kind: Int32?,
      status: Int32?,
      created_at: Time?,
      updated_at: Time?
    )

    has_many :user_events, Models::UserEvent
    has_and_belongs_to_many :users, Models::User, join_table: "user_events"
  end
end
