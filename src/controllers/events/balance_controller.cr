module Events
  class BalancesController < ApplicationController
    def index
      transactions = MoneyTransaction.where(event_id: params[:event_id]).select

      results = transactions.each_with_object(Hash(Int64, Int32).new) do |transaction, values|
        from = transaction.from_id.not_nil!
        to = transaction.to_id.not_nil!
        amount = transaction.amount || 0
        values[from] = values.fetch(from, 0) - amount
        values[to] = values.fetch(to, 0) + amount
      end.map do |k, v|
        {
          id:      k,
          balance: v,
        }
      end

      respond_with do
        json results.to_json
      end
    end
  end
end
