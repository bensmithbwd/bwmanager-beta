class AddVariousToCampaigns < ActiveRecord::Migration
  def change
    change_table :campaigns do |t|
      t.text :links, :after => :autoemails
      t.boolean :complete, :after => :links
      t.date :links_index, :after => :complete
    end
  end
end
