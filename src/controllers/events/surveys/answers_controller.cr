module Events
  module Surveys
    class AnswersController < ApplicationController
      def show
        respond_with do
          json "{}"
        end
      end

      def create
        answers = params[:answers].map do |answer|
          Survey::Answer.new(
            user_id: context.current_user_id,
            response_id: answer
          )
        end

        Survey::Answer.import(answers)

        respond_with(204) {}
      end

      def delete
        Survey::Answer.delete(params[:answers])

        respond_with(204) {}
      end
    end
  end
end
