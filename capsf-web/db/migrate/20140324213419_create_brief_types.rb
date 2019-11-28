class CreateBriefTypes < ActiveRecord::Migration
  def change
    create_table :brief_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
