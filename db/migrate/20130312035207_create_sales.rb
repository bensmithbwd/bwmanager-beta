class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :quote
      t.date :invoice
      t.references :client

      t.timestamps
    end
    add_index :sales, :client_id
  end
end
