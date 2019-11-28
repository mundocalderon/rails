class Gig < ActiveRecord::Base
  attr_accessible :date, :venue, :location, :details, :link, :tour_id, :gig_type_ids
  has_and_belongs_to_many :gig_types
  belongs_to :tour
  
  def with_tpc? # This method is only used in Views. This is probably a dumb way to do it, so I should come back and check.
    self.gig_types.map(&:title).include?("The Primary Colours") 
  end
end
