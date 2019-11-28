class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :entries, :url, :author
  end

  def down
    rename_column :entries, :author, :url
  end
end
