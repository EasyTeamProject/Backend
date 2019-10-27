module Models
  class User < Jennifer::Model::Base
    with_timestamps

    mapping(
      id: Primary64,
      email: String?,
      first_name: String?,
      last_name: String?,
      password: String?,
      created_at: Time?,
      updated_at: Time?
    )
  end
end
