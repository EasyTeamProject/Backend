module Events
  class InvitationsController < ApplicationController
    # Steps
    # 1 - Verify user is event admin
    # 2 - Select invitation strategy (email - friend - facebook)
    # 3 - Create the invitation
    def create
      event = UserEvent.find_by(
        user_id: context.current_user_id,
        event_id: params[:event_id]
      )

      as_admin_of(event) do
        invitation = UserEvent.new(
          user_id: params[:user_id],
          event_id: params[:event_id],
          is_admin: params[:is_admin]? || false
        )
        if invitation.save
          respond_with do
            json invitation.to_json
          end
        else
          render_granite_errors(invitation.errors, 400)
        end
      end
    end

    def delete
      event = UserEvent.find_by(
        user_id: context.current_user_id,
        event_id: params[:event_id]
      )

      as_admin_of(event) do
        invitation = UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id])

        invitation.try &.destroy

        respond_with(204) { json "" }
      end
    end
  end
end
