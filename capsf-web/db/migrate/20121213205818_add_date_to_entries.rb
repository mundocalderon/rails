class AddDateToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :document_date, :date
    add_column :entries, :published, :boolean, :default => false
  end
end
