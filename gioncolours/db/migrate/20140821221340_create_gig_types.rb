class CreateGigTypes < ActiveRecord::Migration
  def change
    create_table :gig_types do |t|
      t.string :title

      t.timestamps
    end
    
    create_table :gig_types_gigs do |t|
      t.integer :gig_type_id
      t.integer :gig_id
      
      t.timestamps
    end
  end
end
