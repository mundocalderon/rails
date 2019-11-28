class AddDetailsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :citation, :string
    
    create_table :books_editors, :id => false do |t|
      t.references :book
      t.references :editor
    end
    add_index :books_editors, [:book_id, :editor_id]
    add_index :books_editors, [:editor_id, :book_id]
  end
end
