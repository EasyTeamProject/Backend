require "./spec_helper"
require "../../src/models/money_transaction.cr"

describe MoneyTransaction do
  Spec.before_each do
    MoneyTransaction.clear
  end
end
