class Campaign < ActiveRecord::Base
  belongs_to :client
  belongs_to :url
  belongs_to :keyphrase
  attr_accessible :autoemails, :complete, :ctype, :length, :links, :links_index, :start, :ttype, :keyphrase_id, :url_id, :client_id
  
  scope :ttype_dates, select("COUNT(id) AS total, ttype, start AS start_time").where("start != ''").group(:start,:ttype)
  scope :links_index_dates, select("COUNT(id) AS total, links_index AS ttype, links_index AS start_time").where("links_index != ''").group(:links_index)
  
  validates :client_id, :presence => true
  validates :url_id, :presence => true
  validates :keyphrase, :presence => true
  validates :start, :presence => true
  validates :ttype, :presence => true
  validates :ctype, :presence => true
  
  resourcify
end
