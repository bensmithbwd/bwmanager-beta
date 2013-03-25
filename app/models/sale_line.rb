class SaleLine < ActiveRecord::Base
  belongs_to :sale
  acts_as_list scope: :sale
  attr_accessible :amount, :description, :name, :optional, :quantity, :sale_id
  
  validates :name, :presence => true
  validates :amount, :presence => true
  validates :quantity, :presence => true
end
