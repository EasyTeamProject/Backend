module Models
  class UserEvent < Jennifer::Model::Base
    with_timestamps

    mapping(
      id: Primary64,
      is_admin: Bool?,
      created_at: Time?,
      updated_at: Time?
    )

    belongs_to :user, Models::User
    belongs_to :event, Models::Event
  end
end
