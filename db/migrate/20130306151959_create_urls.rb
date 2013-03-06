class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.references :client

      t.timestamps
    end
    add_index :urls, :client_id
  end
end
