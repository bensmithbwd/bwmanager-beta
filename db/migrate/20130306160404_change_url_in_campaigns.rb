class ChangeUrlInCampaigns < ActiveRecord::Migration
  def up
    rename_column :campaigns, :url, :url_id
    change_column :campaigns, :url_id, :integer
    add_index :campaigns, :url_id
  end

  def down
    rename_column :campaigns, :url_id, :url
    change_column :campaigns, :url, :string
    remove_index :campaigns, :url
  end
end
