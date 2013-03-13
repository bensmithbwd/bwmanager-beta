class AddTypeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :ttype, :string, :after => :balance
  end
end
