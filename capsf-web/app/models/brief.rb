class Brief < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :brief_court_id, :brief_division_id, :brief_source_id, :brief_type_id, :title, :date_filed, :isAtkins, :isExhibit, :doc
  scope :by_join_date, order("created_at DESC")
  scope :names, select("title")
  default_scope order('last_name ASC')
  
  belongs_to :brief_type
  belongs_to :brief_court
  belongs_to :brief_division
  belongs_to :brief_source
  mount_uploader :doc, EntryDocUploader  

  include Tire::Model::Search
  include Tire::Model::Callbacks
 
=begin include PublicActivity::Model
  #owner isn't currently used because Devise User doesn't have a username or nickname.
  tracked :owner => User.first,
         :params => {:title => :title, 
            :description => :brief_type_name, 
            :author => :source,
            :doc_url => proc {|controller, model_instance| model_instance.doc.file.filename if model_instance.doc.present?},
            :categories => proc {|controller, model_instance| model_instance.cats},
            :published => :published
          }
=end  

  mapping :_source => { :excludes => ['attachment'] } do
     indexes :attachment, :type => 'attachment'
  end
 
 def to_indexed_json
   {
     :first_name    => first_name,
     :last_name     => last_name,
     :court         => brief_court_name,
     :division      => brief_division_name,
     :source        => brief_source_name,
     :title         => title,
     :attachment    => attachment
     
   }.to_json
 end
 
 def brief_type_name
   brief_type.try(:name)
 end
 
 def brief_source_name
   brief_source.try(:name)
 end
 
 def brief_division_name
   brief_division.try(:name)
 end
 
 def brief_court_name
   brief_court.try(:name)
 end

 def self.search(params)
   tire.search(load:true, page: params[:page], per_page: 25) do
     query { string params[:query], default_operator: "AND" } if params[:query].present?
     filter :term
   end
 end

 def attachment
   if doc.present?
     path_to_document = doc.current_path
     return Base64.encode64(open(path_to_document) { |file| file.read}) 
   else
     return Base64.encode64(open(Rails.public_path+"/missing.txt") { |file| file.read})
   end
 end
  
end
