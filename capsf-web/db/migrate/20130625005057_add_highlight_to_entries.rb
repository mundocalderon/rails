class AddHighlightToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :highlight, :boolean
  end
end
