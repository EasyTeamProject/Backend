class EventsController < ApplicationController
  def index
    events = Event.all

    respond_with do
      json events.to_json
    end
  end

  def show
    event = Event.find(params[:id])

    respond_with do
      json EventSerializer::WithInvitation.render(event.not_nil!)
    end
  end

  def create
    service_event = Events::Create.new(Times::Parse::ISO8601Date.new)
    event = service_event.call(event_params[:name], event_params[:date])

    if event.save
      service_link = Events::Link.new
      link = service_link.call(context.current_user_id, event.id, true)

      if link.save
        respond_with do
          json event.to_json
        end
      else
        event.destroy
        respond_with do
          json({error: "An error"}.to_json)
        end
      end
    else
      respond_with do
        json({error: "An error"}.to_json)
      end
    end
  end

  private def event_params
    params.validation do
      required(:name)
      required(:date)
    end
  end
end
