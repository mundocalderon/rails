class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.string :post_date
      t.string :attachment

      t.timestamps
    end
  end
end
