class EventsController < ApplicationController
  def index
    events = Event.all

    respond_with do
      json events.to_json
    end
  end
end
