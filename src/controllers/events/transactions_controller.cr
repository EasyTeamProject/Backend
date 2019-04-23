module Events
  class TransactionsController < ApplicationController
    def index
      transactions = MoneyTransaction.where(event_id: params[:event_id]).select

      respond_with do
        json transactions.to_json
      end
    end

    def create
      transaction = MoneyTransaction.new(
        from_id: transaction_params[:from_id],
        to_id: transaction_params[:to_id],
        event_id: transaction_params[:event_id],
        amount: transaction_params[:amount]
      )

      if transaction.save
        respond_with do
          json transaction.to_json
        end
      else
        respond_with do
          json({ error: "An error" }.to_json)
        end
      end
    end

    private def transaction_params
      params.validation do
        required(:from_id)
        required(:to_id)
        required(:event_id)
        required(:amount)
      end
    end
  end
end
