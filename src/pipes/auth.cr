module Pipes
  class Auth < Amber::Pipe::Base
    JWT_ALGORITHM = "HS256"
    SECRET_KEY = "foobar"

    def call(context)
      begin
        token = context.request.headers["JWT"]
        data = ::Auth::JWTBuilder.new.decode(token)
      rescue JWT::VerificationError
        return not_auth(context)
      end

      user_id = data[0]["user_id"]

      call_next(context)
    end

    private def not_auth(context)
      context.response.status_code = 404
      error = { error: "Please Sign In" }.to_json
      context.response.print error
    end
  end
end
