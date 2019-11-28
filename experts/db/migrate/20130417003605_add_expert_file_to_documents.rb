class AddExpertFileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :expert_file, :string
  end
end
