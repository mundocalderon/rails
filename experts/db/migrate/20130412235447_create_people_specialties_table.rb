class CreatePeopleSpecialtiesTable < ActiveRecord::Migration
  def up
    create_table :people_specialties, :id => false do |t|
      t.references :person
      t.references :specialty
    end
    add_index :people_specialties, [:specialty_id, :person_id]
    add_index :people_specialties, [:person_id, :specialty_id]
  end

  def down
    drop_table :people_specialties
  end
end
