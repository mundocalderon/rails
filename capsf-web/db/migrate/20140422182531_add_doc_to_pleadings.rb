class AddDocToPleadings < ActiveRecord::Migration
  def change
    add_column :pleadings, :doc, :string
  end
end
