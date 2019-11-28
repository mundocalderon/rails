class BriefDivision < ActiveRecord::Base
  attr_accessible :name
  has_many :briefs

  def self.ransackable_attributes(auth_object = nil)
    super & ['name']
  end
end
