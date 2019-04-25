module Events
  class Link
    def call(user_id, event_id, is_admin) : UserEvent
      UserEvent.new user_id: user_id, event_id: event_id, is_admin: is_admin
    end
  end
end
