class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :client
      t.string :url
      t.string :keyphrase
      t.string :ctype
      t.date :start
      t.integer :length, :default => 30
      t.integer :autoemails, :default => 3

      t.timestamps
    end
    add_index :campaigns, :client_id
  end
end
