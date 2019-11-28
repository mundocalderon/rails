class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name  
      t.timestamps
    end
    
    create_table :books_contributors, :id => false do |t|
      t.references :book
      t.references :contributor
    end
    add_index :books_contributors, [:book_id, :contributor_id]
    add_index :books_contributors, [:contributor_id, :book_id]
  end
end
