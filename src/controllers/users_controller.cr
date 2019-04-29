class UsersController < ApplicationController
  def index
    users = User.all

    respond_with do
      json UserSerializer.render(users.to_a)
    end
  end

  def create
    service = Users::Create.new
    user = service.call(
      user_params[:email],
      user_params[:password],
      Auth::PasswordEncrypter.new
    )

    if user.save
      respond_with do
        json UserSerializer.render(user)
      end
    else
      respond_with do
        json({error: "An error"}.to_json)
      end
    end
  end

  private def user_params
    params.validation do
      required(:email) { |p| p.email? }
      required(:password)
    end
  end
end
