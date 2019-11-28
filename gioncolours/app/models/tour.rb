class Tour < ActiveRecord::Base
  attr_accessible :title, :date_begin, :date_end, :description, :gigs_attributes
  has_many :gigs
  accepts_nested_attributes_for :gigs, :allow_destroy => true
  
end
