class Announcement < ActiveRecord::Base
  attr_accessible :title, :content, :post_date, :attachment, :announcement_type_ids
  has_and_belongs_to_many :announcement_types
  mount_uploader :attachment, AttachmentUploader
  include Bootsy::Container
  
end
