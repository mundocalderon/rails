class CreatePleadings < ActiveRecord::Migration
  def change
    create_table :pleadings do |t|
      t.string :title
      t.string :description
      t.string :date_filed
      t.string :agency
      t.string :case_name
      t.string :request_by
      t.boolean :permission
      t.boolean :isAvailable
      t.boolean :isReviewed
      t.timestamps
    end
    
  end
end
