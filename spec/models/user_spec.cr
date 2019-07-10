require "./spec_helper"
require "../../src/models/user.cr"

describe User do
  it "do" do
    UserEvent.import([
      UserEvent.new(user_id: 55, event_id: 51),
      UserEvent.new(user_id: 54, event_id: 51),
      UserEvent.new(user_id: 53, event_id: 51),
      UserEvent.new(user_id: 52, event_id: 51),
      UserEvent.new(user_id: 51, event_id: 51),
      UserEvent.new(user_id: 50, event_id: 50)
    ])
  end
end
