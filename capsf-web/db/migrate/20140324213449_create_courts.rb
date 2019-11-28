class CreateCourts < ActiveRecord::Migration
  def change
    create_table :brief_courts do |t|
      t.string :name

      t.timestamps
    end
  end
end
