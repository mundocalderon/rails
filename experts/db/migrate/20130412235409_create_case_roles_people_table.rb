class CreateCaseRolesPeopleTable < ActiveRecord::Migration
  def up
    create_table :case_roles_people, :id => false do |t|
      t.references :case_role
      t.references :person
    end
    add_index :case_roles_people, [:case_role_id, :person_id]
    add_index :case_roles_people, [:person_id, :case_role_id]
  end

  def down
    drop_table :case_roles_people
  end
end
