class Person < ActiveRecord::Base
  attr_accessible :date_of_birth, :date_of_death, :first_name, :hidden_note, :last_name, :license, 
                  :middle_initial, :social_security_number, :spanish_speaking, :status, :suffix, :tax_id, :nickname,
                  :case_role_ids, :specialty_ids, :credential_ids, :addresses_attributes, :contacts_attributes, :documents_attributes
  acts_as_commentable
  has_many :addresses
  has_many :contacts
  has_many :documents
  has_and_belongs_to_many :specialties
  has_and_belongs_to_many :credentials
  has_and_belongs_to_many :case_roles
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true
  accepts_nested_attributes_for :documents, allow_destroy: true
  validates_uniqueness_of :first_name, :scope => [:last_name, :middle_initial, :date_of_birth]
  default_scope order('first_name ASC')
  
  before_validation :uppercase
  
  def uppercase
    self.middle_initial.upcase!
  end
  
  UNRANSACKABLE_ATTRIBUTES = ["id", "hidden_note", "created_at", "updated_at"]
  
  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
  
end
