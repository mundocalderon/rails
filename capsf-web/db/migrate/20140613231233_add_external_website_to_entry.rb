class AddExternalWebsiteToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :external_website, :string
  end
end
