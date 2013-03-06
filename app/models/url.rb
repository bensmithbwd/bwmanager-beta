class Url < ActiveRecord::Base
  has_many :campaigns
  has_many :clients, :through => :campaigns
  has_many :keyphrases, :through => :campaigns
  attr_accessible :url
  
  validates :url, :presence => true
end
