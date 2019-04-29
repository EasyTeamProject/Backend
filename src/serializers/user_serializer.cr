require "crinder"

class UserSerializer < Crinder::Base(User)
  field id! : Int64, as: id
  field email : String
  field name : String, value: fullname
  field created_at : String
  field updated_at : String

  def self.fullname
    (object.first_name || "") + " " + (object.last_name || "")
  end
end
