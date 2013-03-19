class Transaction < ActiveRecord::Base
  attr_accessible :balance, :credit, :date, :debit, :description, :ttype
  
  def self.range(y, z)
    where("date BETWEEN ? AND ?", y, z)
  end
  
  def self.by_type(t)
    where(:ttype => t)
  end
  
  def self.credit_total
    sum(:credit)
  end
  
  def self.debit_total
    sum(:debit)
  end
end
