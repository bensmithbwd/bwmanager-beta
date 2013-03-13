class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.decimal :debit
      t.decimal :credit
      t.decimal :balance

      t.timestamps
    end
  end
end
