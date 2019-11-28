class CaseRole < ActiveRecord::Base
  attr_accessible :description, :role
  has_and_belongs_to_many :people
end
