class CreateKeyphrases < ActiveRecord::Migration
  def change
    create_table :keyphrases do |t|
      t.string :keyphrase

      t.timestamps
    end
  end
end
