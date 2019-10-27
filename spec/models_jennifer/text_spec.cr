require "./spec_helper"
require "../../src/models_jennifer/user"
require "../../src/models_jennifer/user_event"
require "../../src/models_jennifer/event"

describe Models::User do
  it "should be a test" do
    pp "test"

    # Models::Event.create(name: "Real spec", date: Time.now, kind: 1)
    # Models::User.create(email: "toto@foo.bar", first_name: "toto", last_name: "foo")
    # Models::User.create(email: "zag@biz.bar", first_name: "zag", last_name: "biz")
    # Models::UserEvent.create(event_id: 1, user_id: 1, is_admin: true)
    # Models::UserEvent.create(event_id: 1, user_id: 2, is_admin: false)

    events = Models::Event.all.join(Models::UserEvent) do
      _event_id == _events__id
    end.join(Models::User) do
      _id == _user_events__user_id
    end.with_relation(:user_events).with_relation(:users)
    # pp events.to_a
    pp events
  end
end

# .join(Models::User) do
#   _id = _user_event_user_id
# end