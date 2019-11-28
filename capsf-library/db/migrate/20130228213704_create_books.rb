class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title
      t.string  :publication_type
      t.string  :date_of_publication
      t.string  :published_by
      t.string  :edition
      t.integer :number_of_copies
      t.string  :volume
      t.string  :location
      

      t.timestamps
    end
  end
end
