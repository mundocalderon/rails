class Video < ActiveRecord::Base
  attr_accessible :title, :description, :video_type_ids, :video_url
  has_and_belongs_to_many :video_types
end
