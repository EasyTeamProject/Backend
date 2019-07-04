require "crinder"

class EventMediaSerializer < Crinder::Base(EventMedia)
  field id! : Int64, as: id

  field user, with: UserSerializer, value: ->{ object.user }
  field storage! : String, as: storage
end
