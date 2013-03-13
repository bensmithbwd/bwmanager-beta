class ChangePrecisionInTransactions < ActiveRecord::Migration
  def up
    change_table :transactions do |t|
      t.change :debit, :decimal, :precision => 10, :scale => 2
      t.change :credit, :decimal, :precision => 10, :scale => 2
      t.change :balance, :decimal, :precision => 10, :scale => 2
    end
  end

  def down
    change_table :transactions do |t|
      t.change :debit, :decimal, :precision => 10, :scale => 0
      t.change :credit, :decimal, :precision => 10, :scale => 0
      t.change :balance, :decimal, :precision => 10, :scale => 0
    end
  end
end
