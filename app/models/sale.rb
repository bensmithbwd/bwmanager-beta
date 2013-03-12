class Sale < ActiveRecord::Base
  belongs_to :client
  # attr_accessible :title, :body
end
