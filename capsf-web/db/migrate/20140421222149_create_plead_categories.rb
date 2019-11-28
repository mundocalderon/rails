class CreatePleadCategories < ActiveRecord::Migration
  def change
    create_table :plead_categories do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
