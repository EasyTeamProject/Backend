require "crinder"

class EventSerializer < Crinder::Base(Event)
  field id! : Int64, as: id
  field name : String?
  field date : Time?
  field subject : String?
  field information : String?

  field created_at : String
  field updated_at : String

  class Membership < Crinder::Base(Event::Membership)
    field user_id : Int64?
    field first_name : String?
    field last_name : String?
    field is_admin : Bool?
    field invitation_date : String
  end

  class WithInvitation < self
    field :members, with: EventSerializer::Membership, value: ->{ object.members }
  end
end
