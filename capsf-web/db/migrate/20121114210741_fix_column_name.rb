class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :entries, :url, :author
    remove_column :entries, :document_file_name
    remove_column :entries, :document_content_type
    remove_column :entries, :document_file_size
    remove_column :entries, :document_updated_at
  end

  def down
    rename_column :entries, :author, :url
    add_column :entries, :document_file_name, :varchar
    add_column :entries, :document_content_type, :varchar
    add_column :entries, :document_file_size, :int
    add_column :entries, :document_updated_at, :datetime
  end
end
