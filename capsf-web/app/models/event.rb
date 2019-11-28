class Event < ActiveRecord::Base
  include PublicActivity::Model

  attr_accessible :name, :description, :event_type, :host, :published, :start_date, :end_date, :attachment, :attachment_name, :created_at

  validates_presence_of :name, :start_date
  mount_uploader :attachment, AttachmentUploader
  
  tracked :owner => User.first,
          :params => {:title => :name,
            :description => :event_type,
            :host => :host,
            :published => :published,
            :date => :start_date
          }

end
