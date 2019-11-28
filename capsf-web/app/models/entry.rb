class Entry < ActiveRecord::Base
  attr_accessible :description, :title, :author, :category_ids, :subcategory_ids, :entry_type_id, 
    :doc, :published, :document_date, :categories, :tag_list, :highlight, :external_website
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")
  scope :names, select("title")
  scope :list_by_tagged, lambda {|tag| tagged_with(tag)}
  default_scope order('title ASC').where("published = 1")
  
  
  include PublicActivity::Model
  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  #owner isn't currently used because Devise User doesn't have a username or nickname.
  tracked :owner => User.first,
         :params => {:title => :title, 
            :description => :entry_type_name, 
            :author => :author,
            :doc_url => proc {|controller, model_instance| model_instance.doc.file.filename if model_instance.doc.present?},
            :categories => proc {|controller, model_instance| model_instance.cats},
            :published => :published
          }
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subcategories
  belongs_to :entry_type
  validates_uniqueness_of :title, :scope => :document_date
  validates_presence_of :entry_type
  mount_uploader :doc, EntryDocUploader

  mapping :_source => { :excludes => ['attachment'] } do
      indexes :attachment, :type => 'attachment'
  end
  
  def to_indexed_json
    {
    :title          => title,
    :description    => description,
    :categories     => {:categories_name => cats}, #categories.map { |c| { :categories_name => c.name}}.to_sentence,
    :subcategories  => {:subcategories_name => subcats}, # subcategories.map { |s| { :subcategories_name => s.name}},
    :entry_type     => entry_type_name,
    :attachment      => attachment,
    :published      => published
    }.to_json
  end

  def self.search(params)
    tire.search(load:true, page: params[:page], per_page: 10) do
      query { string params[:query], default_operator: "AND" } if params[:query].present?
      filter :term, :published => "true"
      #size 10
    end
  end

  def entry_type_name
    entry_type.name
  end

  def cats
    categories.map(&:name).to_sentence
  end

  def subcats
    subcategories.map(&:name).to_sentence
  end

  def attachment
    if doc.present?
      path_to_document = doc.current_path
      logger.info "*******************#{path_to_document} **************#{doc}"
      return Base64.encode64(open(path_to_document) { |file| file.read}) 
    else
      logger.info "*******************#{path_to_document} **************#{doc}*********"
      return Base64.encode64(open(Rails.public_path+"/missing.txt") { |file| file.read})
    end
  end  

end
