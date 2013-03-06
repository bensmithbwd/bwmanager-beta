class ChangeKeyphraseInCampaigns < ActiveRecord::Migration
  def up
    rename_column :campaigns, :keyphrase, :keyphrase_id
    change_column :campaigns, :keyphrase_id, :integer
    add_index :campaigns, :keyphrase_id
  end

  def down
    rename_column :campaigns, :keyphrase_id, :keyphrase
    change_column :campaigns, :keyphrase, :string
    remove_index :campaigns, :keyphrase
  end
end
