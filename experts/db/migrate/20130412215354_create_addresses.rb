class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :addr_status
      t.date :active_date_from
      t.date :active_date_to
      t.string :county
      t.references :person

      t.timestamps
    end
  end
end
