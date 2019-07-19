class SessionsController < ApplicationController
  def show
    user = User.find!(context.current_user_id)

    respond_with do
      json UserSerializer.render(user)
    end
  end

  def create
    user = User.find_by(email: auth_params[:email])

    if user
      if password = user.password
        if Crypto::Bcrypt::Password.new(password) == auth_params[:password]
          respond_with do
            json(
              {
                "success": Auth::JWTBuilder.new.encode({user_id: user.id}),
                "user": JSON.parse(UserSerializer.render(user))
              }.to_json)
          end
        else
          respond_with do
            json({"error": "no match"}.to_json)
          end
        end
      else
        respond_with do
          json({"error": "not password :o"}.to_json)
        end
      end
    else
      respond_with do
        json({"error": "email doesn't exist"}.to_json)
      end
    end
  end

  def delete
  end

  private def auth_params
    params.validation do
      required(:email) { |p| p.email? }
      required(:password)
    end
  end
end
