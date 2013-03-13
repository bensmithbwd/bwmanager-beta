class Transaction < ActiveRecord::Base
  attr_accessible :balance, :credit, :date, :debit, :description, :ttype
end
