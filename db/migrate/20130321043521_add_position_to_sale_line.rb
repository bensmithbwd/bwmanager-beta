class AddPositionToSaleLine < ActiveRecord::Migration
  def change
    add_column :sale_lines, :position, :integer, :after => :optional
  end
end
