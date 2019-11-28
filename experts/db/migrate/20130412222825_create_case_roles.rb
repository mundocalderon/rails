class CreateCaseRoles < ActiveRecord::Migration
  def change
    create_table :case_roles do |t|
      t.string :role
      t.text :description

      t.timestamps
    end
  end
end
