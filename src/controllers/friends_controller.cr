class FriendsController < ApplicationController
    def index
        friends = Friend.all

        respond_with do
            json firends.to_json
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
                json({ error: "An error"}.to_json)
            end
        end
    end
    
    def show
        friend = Friend.find_by from_id: context.current_user_id, to_id: params[:friend_id]

        if friend.save
            respond_with do
                json friend.to_json
            end
        else
            respond_with do
                json({ error: "An error"}.to_json)
            end
        end
    end

    def delete
        friend = Friend.find_by from_id: context.current_user_id, to_id: params[:friend_id]
        
        if friend.save
            respond_with(204) do
                json ""
            end
        end
    end

    end

