class MoneyTransaction < Granite::Base
  include ModelGranite

  adapter pg
  table_name money_transactions

  belongs_to from : User
  belongs_to to : User
  belongs_to event : Event

  primary id : Int64
  field amount : Int32
  timestamps
end
