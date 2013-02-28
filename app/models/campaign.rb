class Campaign < ActiveRecord::Base
  belongs_to :client
  attr_accessible :autoemails, :keyphrase, :length, :start, :ctype, :url, :client_id
  
  validates :client_id, :presence => true
  validates :keyphrase, :presence => true
  validates :start, :presence => true
  validates :ctype, :presence => true
  validates :url, :presence => true
  validates_format_of :url, :without => /\Ahttp/
  validates_format_of :url, :without => /\Awww/
end
