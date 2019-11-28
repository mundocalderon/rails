class CreateDpiChapters < ActiveRecord::Migration
  def change
    create_table :dpi_chapters do |t|
      t.string :title
      t.string :dpi_tag
      t.string :description
    end
  end
end
