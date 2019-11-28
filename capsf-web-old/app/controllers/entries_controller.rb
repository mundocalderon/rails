class EntriesController < ApplicationController
  before_filter :authenticate_user!
  

  # GET /entries
  # GET /entries.json
  def index 
      @entries = Entry.all unless params[:category]
      @entries = Entry.where("categories.slug LIKE ? AND published = true  ",params[:category]).includes(:categories) if params[:category]

      @events_by_date = Event.where("published = ?", true).group_by(&:start_date) if params[:category]
      @date = params[:date] ? Date.parse(params[:date]) : Date.today

      @activities = PublicActivity::Activity.where("parameters LIKE ?", "%true%").order('created_at DESC').page(params[:page]).per(5)
     
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


  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

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
    @entry = Entry.find(params[:id])
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
    @entry = Entry.find(params[:id])
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
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

end
