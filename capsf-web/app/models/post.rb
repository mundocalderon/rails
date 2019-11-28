class Post < ActiveRecord::Base
  belongs_to :page
  versioned

  has_attached_file :attachment,
                    :url  => "/assets/attachments/:basename.:extension",
                    :path => ":rails_root/public/assets/attachments/:basename.:extension"

  before_post_process :image?

  validates_presence_of :title, :page_id

  attr_accessible :title, :content, :attachment, :locked, :page_id

  def image?
    !(attachment_content_type =~ /^image.*/).nil?
  end

end
