class CreateAnnouncementTypes < ActiveRecord::Migration
  def change
    create_table :announcement_types do |t|
      t.string :title

      t.timestamps
    end
    
    create_table :announcement_types_announcements do |t|
      t.integer :announcement_type_id
      t.integer :announcement_id
      
      t.timestamps
    end
  end
end
