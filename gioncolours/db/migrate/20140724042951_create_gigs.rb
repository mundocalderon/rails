class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :date
      t.string :venue
      t.string :location
      t.text :details
      t.string :link

      t.timestamps
    end
  end
end
