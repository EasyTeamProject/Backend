require "crypto/bcrypt/password"

module Auth
  class PasswordEncrypter
    def call(password : String) : String
      Crypto::Bcrypt::Password.create(password, cost: 10).to_s
    end
  end
end
