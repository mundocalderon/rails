class Entry < ActiveRecord::Base
  attr_accessible :description, :title, :author, :category_ids, :subcategory_ids, :entry_type_id, 
    :doc, :published, :document_date, :categories
  
  include Tire::Model::Search
  include Tire::Model::Callbacks
  include PublicActivity::Model
  
  #owner isn't currently used because Devise User doesn't have a username or nickname.
  tracked :owner => User.first,
          :params => {:title => :title, 
            :description => :entry_type_name, 
            :author => :author,
            :doc_url => proc {|controller, model_instance| model_instance.doc.file.filename if model_instance.doc.present?},
            :categories => proc {|controller, model_instance| model_instance.category_names},
            :published => :published
          }
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subcategories
  belongs_to :entry_type

  validates_presence_of :entry_type
  mount_uploader :doc, EntryDocUploader

    mapping do
      indexes :title  
      indexes :description
      indexes :categories do 
        indexes :name
      end
      indexes :subcategories do
        indexes :name
      end
      indexes :entry_type
      indexes :doc, :type => 'attachment'
    end
  
  def to_indexed_json
    {
    :title          => title,
    :description    => description,
    :categories     => categories.map { |c| { :name => c.name}},
    :subcategories  => subcategories.map { |s| { :name => s.name}},
    :entry_type     => entry_type_name,
    :doc            => attachment
    }.to_json
  end

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query], default_operator: "AND" } if params[:query].present?
      filter :term, :published => true
    end
  end

  def entry_type_name
    entry_type.name
  end

  def category_names
    categories.map(&:name).to_sentence
  end

  def subcategory_name
    subcategories.map(&:name).to_sentence
  end

  def attachment
    if doc.present?
      path_to_document = Rails.public_path+"#{doc}"
      Base64.encode64(open(path_to_document) { |file| file.read})
    end
  end

end
