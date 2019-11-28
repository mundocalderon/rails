class AddDocToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :doc, :string
  end
end
