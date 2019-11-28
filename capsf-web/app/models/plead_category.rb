class PleadCategory < ActiveRecord::Base
  attr_accessible :title, :description
  has_and_belongs_to_many :pleadings

  def self.ransackable_attributes(auth_object = nil)
    super & ['title']
  end
end
