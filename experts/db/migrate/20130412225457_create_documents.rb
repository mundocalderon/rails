class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :document_type
      t.string :description
      t.date :date_of_file
      t.references :person

      t.timestamps
    end
  end
end
