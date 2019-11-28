class CreateAssociationTables < ActiveRecord::Migration
  def up
    create_table :plead_categories_pleadings, :id => false do |t|
      t.references :pleading
      t.references :plead_category
    end
    
    create_table :plead_keywords_pleadings, :id => false do |t|
      t.references :pleading
      t.references :plead_keyword
    end
    
    create_table :dpi_chapters_pleadings, :id => false do |t|
      t.references :dpi_chapter
      t.references :pleading
    end
    
  end

  def down
    drop_table :plead_categories_pleadings
    drop_table :plead_keywords_pleadings
    drop_table :dpi_chapters_pleadings
  end
end
