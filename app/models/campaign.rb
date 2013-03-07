class Campaign < ActiveRecord::Base
  belongs_to :client
  belongs_to :url
  belongs_to :keyphrase
  attr_accessible :autoemails, :complete, :ctype, :length, :links, :links_index, :start, :ttype, :keyphrase_id, :url_id, :client_id
  
  scope :ttype_dates, select("COUNT(id) AS total, ctype, start AS start_time").where("start != ''").group(:start,:ctype)
  scope :links_index_dates, select("COUNT(id) AS total, links_index AS ctype, links_index AS start_time").where("links_index != ''").group(:links_index)
  
  ransacker :end do |r|
     Arel::Nodes::SqlLiteral.new("DATE_ADD(`campaigns`.`start`, INTERVAL `campaigns`.`length` DAY)")
  end
  
  def end
    start + length.days
  end
  
  def days_action_campaign_end
    (Time.now.minus_with_coercion((start + length.days).to_time)/86400).round
  end
  
  def days_action_links_index
    (Time.now.minus_with_coercion((links_index).to_time)/86400).round
  end
  
  validates :client_id, :presence => true
  validates :url_id, :presence => true
  validates :keyphrase, :presence => true
  validates :start, :presence => true
  validates :ttype, :presence => true
  validates :ctype, :presence => true
  
  resourcify
end
