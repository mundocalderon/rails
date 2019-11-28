class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :event_type
      t.string :host
      t.boolean :published
      t.date :start_date
      t.date :end_date
      t.string :attachment
      t.string :attachment_name

      t.timestamps
    end
  end
end
