class CreateT1links < ActiveRecord::Migration
  def change
    create_table :t1links do |t|
      t.string :keyphrase
      t.text :links

      t.timestamps
    end
  end
end
