class Sale < ActiveRecord::Base
  belongs_to :client
  has_many :sale_lines, :dependent => :destroy, order: :position
  attr_accessible :quote, :invoice, :client_id
  
  validates :client_id, :presence => true
end
