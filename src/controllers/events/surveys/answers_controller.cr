module Events
  module Surveys
    class AnswersController < ApplicationController
      def show
        respond_with do
          json "{}"
        end
      end

      def create
        answers = answer_ids.map do |answer|
          Survey::Answer.new(
            user_id: context.current_user_id,
            survey_response_id: answer
          )
        end

        Survey::Answer.import(answers)

        respond_with(204) { json "" }
      end

      def delete
        Survey::Answer.where(id: answer_ids).select.map &.destroy

        respond_with(204) { json "" }
      end

      private def answer_ids
        params[:answers][1..-2].split(",").map(&.to_i64)
      end
    end
  end
end
