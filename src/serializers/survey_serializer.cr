require "crinder"

class SurveySerializer < Crinder::Base(Survey)
  field id! : Int64, as: id
  field name : String

  field event_id : Int64?

  field questions, with: Surveys::QuestionSerializer, value: ->{ object.questions.to_a }

  field created_at : String
  field updated_at : String
end
