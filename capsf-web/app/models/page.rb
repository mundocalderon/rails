class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :posts
  validates_presence_of :title
  validates_uniqueness_of :title
  attr_accessible :title, :description
  versioned


  #Make sure that a page's title is a single word. 
  #TODO: automate permalink/slugify titles.
  #def to_param
  #  title
  #end

end
