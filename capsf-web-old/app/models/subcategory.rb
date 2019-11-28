class Subcategory < ActiveRecord::Base
  attr_accessible :description, :name, :category_id
  has_and_belongs_to_many :entries


  def self.ransackable_attributes(auth_object = nil)
    super & ['name', 'description']
  end

end
