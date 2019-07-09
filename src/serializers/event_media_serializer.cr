require "crinder"

class EventMediaSerializer < Crinder::Base(EventMedia)
  field id! : Int64, as: id

  field storage! : String, as: storage
end
