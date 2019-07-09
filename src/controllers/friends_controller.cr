class FriendsController < ApplicationController
  def index
    friends = Friend.all("WHERE from_id = #{context.current_user_id} OR to_id = #{context.current_user_id}")

    if friends.size == 0
      respond_with { json "[]" }
    else
      ids = friends.map(&.from_id) + friends.map(&.to_id)
      users = User.all("WHERE id IN (#{ids.join(",")})")

      respond_with do
        json UserSerializer.render(users.to_a)
      end
    end
  end

  def create
    friend = Friend.new from_id: context.current_user_id, to_id: params[:friend_id]

    if friend.save
      respond_with do
        json friend.to_json
      end
    else
      respond_with do
        json({error: "An error"}.to_json)
      end
    end
  end

  def delete
    friend = Friend.find_by from_id: context.current_user_id, to_id: params[:friend_id]

    if friend.try &.destroy
      respond_with(204) do
        json ""
      end
    end
  end
end
