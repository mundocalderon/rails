class CreateSources < ActiveRecord::Migration
  def change
    create_table :brief_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
