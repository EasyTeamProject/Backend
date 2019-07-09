module Events
  class InvitationsController < ApplicationController
    # Steps
    # 1 - Verify user is event admin
    # 2 - Select invitation strategy (email - friend - facebook)
    # 3 - Create the invitation
    def create
      pp params.class
      # 1
      event = UserEvent.find_by(
        user_id: context.current_user_id,
        event_id: params[:event_id]
      )

      if event.try { |e| e.admin? }
        # 2

        # 3
        invitation = UserEvent.new(
          user_id: params[:user_id],
          event_id: params[:event_id]
        )
        if invitation.save
          respond_with do
            json invitation.to_json
          end
        else
          respond_with do
            json({error: "An error on save"}.to_json)
          end
        end
      else
        respond_with do
          json({error: "An error, not admin"}.to_json)
        end
      end
    end
  end
end
