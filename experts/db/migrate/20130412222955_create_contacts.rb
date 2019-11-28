class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_string
      t.string :contact_type
      t.text :note
      t.references :person

      t.timestamps
    end
  end
end
