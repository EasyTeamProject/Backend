module Users
  class Create
    def call(email : String, password : String,
             first_name : String, last_name : String, password_strategy) : User
      User.new email: email, password: password_strategy.call(password),
               first_name: first_name, last_name: last_name
    end
  end
end
