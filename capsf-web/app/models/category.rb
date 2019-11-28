class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :description, :name
  has_and_belongs_to_many :entries
  has_many :subcategories

  def self.ransackable_attributes(auth_object = nil)
    super & ['name', 'description']
  end

end
