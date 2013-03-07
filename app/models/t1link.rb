class T1link < ActiveRecord::Base
  belongs_to :keyphrase
  attr_accessible :keyphrase_id, :links

  validates :keyphrase_id, :presence => true, :uniqueness => true
  validates :links, :presence => true
end
