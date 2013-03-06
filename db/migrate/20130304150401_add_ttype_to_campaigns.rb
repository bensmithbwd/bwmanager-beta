class AddTtypeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :ttype, :string, :after => :keyphrase
  end
end
