class Transaction < ActiveRecord::Base
  attr_accessible :date_of_issue, :date_of_return, :user_id, :book_id
  
  belongs_to :user
  belongs_to :book
  
  UNRANSACKABLE_ATTRIBUTES = ["id", "created_at", "updated_at"]
  
  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
  
end
