class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :locked
      t.references :page

      t.timestamps
    end
  end
end
