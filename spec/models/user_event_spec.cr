require "./spec_helper"
require "../../src/models/user_event.cr"

describe UserEvent do
  Spec.before_each do
    UserEvent.clear
  end
end
