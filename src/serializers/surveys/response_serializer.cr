require "crinder"

class Surveys::ResponseSerializer < Crinder::Base(Survey::Response)
  field id! : Int64, as: id
  field text : String
end
