class Contact < ActiveRecord::Base
  attr_accessible :contact_string, :contact_type, :note, :person_id
  belongs_to :person
end
