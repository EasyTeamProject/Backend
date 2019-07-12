module Events
  class SurveysController < ApplicationController
    alias ResultSet = NamedTuple(count: Int32, question: String, question_id: Int64)

    class QuestionLoader
      JSON.mapping(
        text: String,
        responses: Array(String)
      )
    end

    def index
      surveys = Survey.where(event_id: params[:event_id]).select

      respond_with do
        json SurveySerializer.render(surveys.to_a)
      end
    end

    def show
      answers = Survey::Answer::Stat.all <<-SQL
        WHERE surveys.id = #{params[:id]}
      SQL

      result = answers.each_with_object(Hash(Int64, ResultSet).new) do |stat, acc|
        if !acc[stat.survey_question_id!]?
          acc[stat.survey_question_id!] = {
            count: 1,
            question: stat.question!,
            question_id: stat.survey_question_id!
          }
        else
          acc[stat.survey_question_id!] = {
            count: acc[stat.survey_question_id!][:count] + 1,
            question: acc[stat.survey_question_id!][:question],
            question_id: acc[stat.survey_question_id!][:question_id],
          }
        end
      end.values


      respond_with do
        json result.to_json
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

      if event.try(&.admin?)
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
          render_granite_errors(survey.errors, 400)
        end
      else
        respond_with do
          json({error: "An error"}.to_json)
        end
      end
    end
  end
end
