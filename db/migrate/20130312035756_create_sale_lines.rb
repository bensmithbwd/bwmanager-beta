class CreateSaleLines < ActiveRecord::Migration
  def change
    create_table :sale_lines do |t|
      t.string :name
      t.text :description
      t.decimal :amount
      t.integer :quantity
      t.boolean :optional
      t.references :sale

      t.timestamps
    end
    add_index :sale_lines, :sale_id
  end
end
