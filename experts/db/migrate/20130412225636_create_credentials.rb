class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
