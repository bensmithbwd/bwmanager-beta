class RemoveClientIdFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :client_id
  end
end
