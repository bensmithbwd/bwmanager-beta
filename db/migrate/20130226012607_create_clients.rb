class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :company
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :email
      t.text :address
      t.string :leadsource

      t.timestamps
    end
  end
end
