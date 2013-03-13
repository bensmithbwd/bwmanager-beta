class Sale < ActiveRecord::Base
  belongs_to :client
  has_many :sale_lines
  attr_accessible :quote, :invoice, :client_id
end
