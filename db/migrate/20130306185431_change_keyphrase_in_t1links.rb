class ChangeKeyphraseInT1links < ActiveRecord::Migration
  def up
    rename_column :t1links, :keyphrase, :keyphrase_id
    change_column :t1links, :keyphrase_id, :integer
    add_index :t1links, :keyphrase_id
  end

  def down
    rename_column :t1links, :keyphrase_id, :keyphrase
    change_column :t1links, :keyphrase, :string
    remove_index :t1links, :keyphrase
  end
end
