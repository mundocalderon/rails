class RemoveTempFieldsFromPleadings < ActiveRecord::Migration
  def up
      remove_column :pleadings, :temp_dpi_chapter
      remove_column :pleadings, :temp_plead_category
      remove_column :pleadings, :temp_plead_keyword_1
      remove_column :pleadings, :temp_plead_keyword_2
      remove_column :pleadings, :temp_plead_keyword_3
      remove_column :pleadings, :temp_plead_keyword_4 
  end

  def down
      add_column :pleadings, :temp_dpi_chapter, :string
      add_column :pleadings, :temp_plead_category, :string
      add_column :pleadings, :temp_plead_keyword_1, :string
      add_column :pleadings, :temp_plead_keyword_2, :string
      add_column :pleadings, :temp_plead_keyword_3, :string
      add_column :pleadings, :temp_plead_keyword_4, :string
  end
  
end
