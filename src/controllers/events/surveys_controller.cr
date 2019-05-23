module Events
  class SurveysController < ApplicationController
    class QuestionLoader
      JSON.mapping(
        text: String,
        responses: Array(String)
      )
    end

    def index
      surveys = Survey.all

      respond_with do
        json SurveySerializer.render(surveys.to_a)
      end
    end

    # Quick and Dirty
    # This part execute too many requests to the database
    # Possible workarounds :
    # 1 - Use MongoDB as Storage
    # 2 - Use Neo4J as Storage (my favorite)
    # 3 - Use DB transaction and save everythings in 3 SQL requests
    def create
      event = UserEvent.find_by(
        user_id: context.current_user_id,
        event_id: params[:event_id]
      )

      if event.try { |e| e.admin? }
        survey = Survey.new(name: params[:name], event_id: params[:event_id])
        survey.save

        questions = Array(QuestionLoader).from_json(params[:questions])

        questions.each do |question|
          survey_question = Survey::Question.new(survey_id: survey.id, question: question.text)
          survey_question.save

          question.responses.each do |response|
            response = Survey::Response.new(text: response, survey_question_id: survey_question.id)
            response.save
          end
        end

        if survey.save
          respond_with do
            json SurveySerializer.render(survey)
          end
        else
          pp survey.errors
          respond_with do
            json({error: "An error"}.to_json)
          end
        end
      else
        respond_with do
          json({error: "An error"}.to_json)
        end
      end
    end
  end
end
