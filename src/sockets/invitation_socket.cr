struct InvitationSocket < Amber::WebSockets::ClientSocket
  channel "invitation_room:*", InvitationChannel

  def on_connect
    # do some authentication here
    # return true or false, if false the socket will be closed
    true
  end
end
