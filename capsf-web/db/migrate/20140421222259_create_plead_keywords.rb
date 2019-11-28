class CreatePleadKeywords < ActiveRecord::Migration
  def change
    create_table :plead_keywords do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
