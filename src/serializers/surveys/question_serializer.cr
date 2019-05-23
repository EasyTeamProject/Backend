require "crinder"

class Surveys::QuestionSerializer < Crinder::Base(Survey::Question)
  field id! : Int64, as: id

  field question : String

  field responses, with: Surveys::ResponseSerializer, value: ->{ object.responses.to_a }
end
