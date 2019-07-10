class ApplicationController < Amber::Controller::Base
  def as_admin_of(user_event)
    if user_event.try(&.admin?)
      yield
    else
      respond_with(403) do
        json({ errors: "Access refused" }.to_json)
      end
    end
  end

  def render_granite_errors(errors : Array(Granite::Error), code = 400)
    error_hash = errors.each_with_object(Hash(String, String).new) do |error, acc|
      acc[error.field.to_s] = error.message.to_s
    end

    respond_with(code) do
      json({ errors: error_hash }.to_json)
    end
  end
end
