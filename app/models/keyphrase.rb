class Keyphrase < ActiveRecord::Base
  has_one :t1link
  has_many :campaigns
  has_many :clients, :through => :campaigns
  has_many :urls, :through => :campaigns
  attr_accessible :keyphrase

  validates :keyphrase, :presence => true
  validates_format_of :keyphrase, :with => /\A[\w\s]+\Z/i
end
