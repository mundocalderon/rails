class Document < ActiveRecord::Base
  attr_accessible :date_of_file, :description, :document_type, :person_id, :title, :expert_file, :expert_file_cache, :county, :case, :confidential_item
  belongs_to :person
  mount_uploader :expert_file, ExpertFileUploader
end
