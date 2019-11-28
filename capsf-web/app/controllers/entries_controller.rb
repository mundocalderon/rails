class EntriesController < ApplicationController
  before_filter :authenticate_user!
  rescue_from Tire::Search::SearchRequestFailed do |error|
    # Indicate incorrect query to the user
    if error.message =~ /SearchParseException/ && params[:query]
     flash[:error] = "Sorry, your blank query is invalid..."
    else
     # ... handle other possible situations ...
    end
    redirect_to :back
  end

  # GET /entries
  # GET /entries.json
  def index 
    @activities = PublicActivity::Activity.where("parameters LIKE ?", "%true%").order('created_at DESC').page(params[:page]).per(5)
    @tags = Entry.tag_counts_on(:tags).order('count desc')
    @all_tags = ActsAsTaggableOn::Tag.order(:name)
    
    if params[:category]
      @category = Category.where("id LIKE ?", params[:category]).first if params[:category]
      @subcategories = Subcategory.subcategories_of(params[:category]) if params[:category]      
    elsif params[:tag]
      @entries = Entry.tagged_with(params[:tag]).page(params[:page])
    else #no params means index.html.erb
      @entries = Entry.limit(0).all 
    end
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
      format.js
    end
  end

  def search
   #@search = Entry.where("categories.name =?",params[:category]).includes(:categories) if params[:category]
   @search = Entry.ransack(params[:q])
   @entries = @search.result
   @search.build_condition if @search.conditions.empty?
   @search.build_sort if @search.sorts.empty?

   render :search
   
  end

  def advanced_search
    @entries = Entry.search(params)
  end
  

  def tags
    query = params[:q]
    if query[-1] == " "
      query[-1] = ""
      query = query.gsub(" ", "-")
      ActsAsTaggableOn::Tag.find_or_create_by_name(query)
    end

    #Do the search in memory for better performance
    search = query.gsub(" ", "-")
    @tags = ActsAsTaggableOn::Tag.order(:name)
    @tags = @tags.select{ |v| v.name =~ /#{search}/i }
    respond_to do |format|
      format.json{ render :json => @tags.map {|tag| {:id => tag.name, :name => tag.name } }.to_json }
    end
  end


  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.unscoped.find(params[:id])
    @categories = @entry.categories
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.unscoped.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.unscoped.find(params[:id])
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.unscoped.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

end
