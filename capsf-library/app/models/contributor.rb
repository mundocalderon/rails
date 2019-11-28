class Contributor < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :books
  
  UNRANSACKABLE_ATTRIBUTES = ["created_at", "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
