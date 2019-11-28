class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :brief_divisions do |t|
      t.string :name

      t.timestamps
    end
  end
end
