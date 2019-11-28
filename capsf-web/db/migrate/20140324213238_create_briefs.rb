class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.string :first_name
      t.string :last_name
      t.references :brief_court
      t.references :brief_division
      t.references :brief_source
      t.references :brief_type
      t.string :title
      t.date :date_filed
      t.boolean :isAtkins
      t.boolean :isExhibit

      t.timestamps
    end
  end
end
