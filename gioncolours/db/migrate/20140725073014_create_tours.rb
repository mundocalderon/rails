class CreateTours < ActiveRecord::Migration
  def change
    add_reference :gigs, :tour
    
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.string :date_begin
      t.string :date_end

      t.timestamps
    end
    
  end
end
