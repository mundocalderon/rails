class CreateCredentialsPeopleTable < ActiveRecord::Migration
  def up
    create_table :credentials_people, :id => false do |t|
      t.references :person
      t.references :credential
    end
    add_index :credentials_people, [:credential_id, :person_id]
    add_index :credentials_people, [:person_id, :credential_id]
  end

  def down
    drop_table :credentials_people
  end
end
