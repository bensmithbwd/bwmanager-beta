class SaleLine < ActiveRecord::Base
  belongs_to :sale
  attr_accessible :amount, :description, :name, :optional, :quantity, :sale_id
end
