class CreateVideoTypes < ActiveRecord::Migration
  def change
    create_table :video_types do |t|
      t.string :title

      t.timestamps
    end
    
    create_table :video_types_videos do |t|
      t.integer :video_type_id
      t.integer :video_id
      
      t.timestamps
    end
  end
end
