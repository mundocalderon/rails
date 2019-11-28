class Pleading < ActiveRecord::Base
  attr_accessible :title, :date_filed, :description, :isAvailable, :agency, :doc,
  :case_name, :request_by, :permission, :isReviewed, :plead_category_ids, :plead_keyword_ids, :dpi_chapter_ids
  scope :names, select("title")
  scope :pleadings_with_agency, :conditions => ["title LIKE ? ", '%(%)%']
  scope :pleadings_with_case, :conditions => ["description LIKE ? ", '%(%)%']
  scope :update_all_pleadings, lambda { |pleading| where("id != ?", second_pleading.id) }
  
  default_scope order('date_filed DESC')
  
  has_and_belongs_to_many :plead_categories
  has_and_belongs_to_many :plead_keywords
  has_and_belongs_to_many :dpi_chapters
 
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
       :title         => title,
       :date_filed    => date_filed,
       :description   => description,
       :available     => isAvailable, 
       :agency        => agency, 
       :case_name     => case_name, 
       :request_by  => request_by, 
       :permission    => permission, 
       :reviewed      => isReviewed, 
       :categories    => {:categories_name => plead_cats}, 
       :keywords      => {:keywords_name => plead_keys}, 
       :dpi_chapters  => {:dpi_chapters_name => plead_chaps},
       :attachment    => attachment

     }.to_json
   end
   
   def plead_cats
     plead_categories.map(&:title).to_sentence
   end
   
   def plead_keys
     plead_keywords.map(&:title).to_sentence
   end
   
   def plead_chaps
     dpi_chapters.map(&:title).to_sentence
   end
   
   def self.search(params)
     tire.search(load:true, page: params[:page], per_page: 25) do
       query { string params[:query], default_operator: "AND" } if params[:query].present?
       filter :term, :published => "true"
     end
   end

  def attachment
    if doc.present?
      path_to_document = doc.current_path
      logger.info "DOC.PRESENT! *******************#{path_to_document} **************#{doc_url}"
      return Base64.encode64(open(path_to_document) { |file| file.read}) 
    else
      logger.info "*******************#{path_to_document} **************#{doc_url}*********"
      return Base64.encode64(open(Rails.public_path+"/missing.txt") { |file| file.read})
    end
  end
  
  def self.set_agency
    @pleadings = Pleading.pleadings_with_agency
    @pleadings.each do |p|
      agency_temp = p.title.split(/[()]/)
      p.agency = agency_temp[1]
      p.save!
    end
  end
    
  def self.set_case_name
    @pleadings = Pleading.pleadings_with_case
    @pleadings.each do |p|
      case_name_temp = p.description.split(/[()]/)
        case
        when case_name_temp[-1].include?('v.')
          p.case_name = case_name_temp[-1]
        when case_name_temp[-1].include?('In re')
          p.case_name = case_name_temp[-1]
        when case_name_temp[-1].include?('In Re')
          p.case_name = case_name_temp[-1]
        when case_name_temp[-1].include?('Cal.')
          p.case_name = case_name_temp[-1]
        else
          puts "nope"
        end
      p.save!
    end
  end
  
  def self.merge_duplicate_pleadings
    @all_pleadings = all.group_by{|model| [model.title, model.doc_identifier]}
    @all_pleadings.values.each do |duplicates|
      first_one = duplicates.shift
      duplicates.each do |double| 
        puts double.id 
        first_one.merge_pleadings(double)
        double.destroy 
      end
    end
  end
  
  
  def merge_pleadings(second_pleading)
    Pleading.reflect_on_all_associations.each do |association|
      if association.macro == :has_and_belongs_to_many
        association_name = association.name
        self.send(association_name) << second_pleading.send(association_name)
        self.save!
      end
    end
  end
  
  
end
