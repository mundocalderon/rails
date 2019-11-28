class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date_of_issue
      t.date :date_of_return
      t.references :book
      t.references :user
      
      t.timestamps
    end
  end
end
