require "./spec_helper"
require "../../../src/models/survey/question"

describe Survey::Question do
  Spec.before_each do
    Survey::Question.clear
  end
end
