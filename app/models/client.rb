class Client < ActiveRecord::Base
  has_many :campaigns, :dependent => :destroy
  attr_accessible :address, :company, :email, :leadsource, :name, :phone1, :phone2, :phone3
  
  validates :name, :presence => true
  validates :company, :presence => true
end
