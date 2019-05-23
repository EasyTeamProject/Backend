class ApplicationController < Amber::Controller::Base
  module Helpers
    def current_user
      user = User.find(context.current_user_id)

      if user
        Monads::Some.new(user)
      else
        Monads::Nothing(User).new
      end
    end

    def as_admin(user_event)
      yield if user_event.try { |e| e.admin? }
    end
  end
end
