module Users
  class Create
    def call(email : String, password : String, password_strategy) : User
      User.new email: email, password: password_strategy.call(password)
    end
  end
end
