require "jwt"

module Auth
  class JWTBuilder
    JWT_ALGORITHM = "HS256"
    SECRET_KEY    = "foobar"

    def initialize(@algorithm = JWT_ALGORITHM, @secret_key = SECRET_KEY)
    end

    def encode(payload)
      JWT.encode(payload, @secret_key, @algorithm)
    end

    def decode(token : String)
      JWT.decode(token, @secret_key, @algorithm)
    end
  end
end
