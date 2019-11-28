class AddTimestamptoDpiChapters < ActiveRecord::Migration
  def up
    add_column :dpi_chapters, :created_at, :datetime
    add_column :dpi_chapters, :updated_at, :datetime
    change_column :pleadings, :description, :text
    
  end

  def down
    remove_column :dpi_chapters, :created_at
    remove_column :dpi_chapters, :updated_at
    change_column :pleadings, :description, :string
    
  end
end
