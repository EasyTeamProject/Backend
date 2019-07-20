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
    event.subject = event_params[:subject]
    event.information = event_params[:information]
    if event.save
      service_link = Events::Link.new
      link = service_link.call(context.current_user_id, event.id, true)

      if link.save
        respond_with do
          json event.to_json
        end
      else
        event.destroy
        render_granite_errors(link.errors, 400)
      end
    else
      render_granite_errors(event.errors, 400)
    end
  end

  def update
    if event = Event.find(params[:id])
      event.update(
        name: event_params[:name],
        date: Times::Parse::ISO8601Date.new.call(event_params[:date]),
        subject: event_params[:subject],
        information: event_params[:information]
      )

      respond_with do
        json event.to_json
      end
    else
      respond_with(404) do
        json({ error: :not_found }.to_json)
      end
    end
  end

  private def event_params
    params.validation do
      required(:name)
      required(:date)
      required(:subject)
      required(:information)
    end
  end
end
