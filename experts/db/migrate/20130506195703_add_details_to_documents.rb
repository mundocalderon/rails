class AddDetailsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :case, :string
    add_column :documents, :confidential_item, :string
    add_column :documents, :county, :string
  end
end
