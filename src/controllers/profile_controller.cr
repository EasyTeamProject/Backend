class ProfileController < ApplicationController
  def show
    user = User.find!(context.current_user_id)

    respond_with do
      json UserSerializer.render(user)
    end
  end

  def delete
    user = User.find!(context.current_user_id)

    user.email = "anonymous@makeevent.fr"
    user.password = ""
    user.first_name = "Anonymous"
    user.last_name = "Anonymous"

    friends = Friend.where("from_id = #{context.current_user_id} OR to_id = #{context.current_user_id}")
    friends.delete
    user.save

    respond_with(204) { json "" }
  end
end
