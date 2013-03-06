class Client < ActiveRecord::Base
  has_many :campaigns
  has_many :urls, :through => :campaigns
  has_many :keyphrases, :through => :campaigns
  attr_accessible :address, :company, :email, :leadsource, :name, :phone1, :phone2, :phone3
  
  validates :name, :presence => true
  validates :company, :presence => true
  validates :leadsource, :presence => true
end
