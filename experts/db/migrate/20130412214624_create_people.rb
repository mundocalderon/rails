class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :suffix
      t.date :date_of_birth
      t.date :date_of_death
      t.integer :social_security_number
      t.string :tax_id
      t.string :license
      t.text :hidden_note
      t.string :spanish_speaking
      t.string :status

      t.timestamps
    end
  end
end
