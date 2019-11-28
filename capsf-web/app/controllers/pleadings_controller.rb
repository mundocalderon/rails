class PleadingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :has_super_admin_role, :only => [:destroy]
  before_filter :has_admin_role, :only => [:edit, :update]
  rescue_from Tire::Search::SearchRequestFailed do |error|
    # Indicate incorrect query to the user
    if error.message =~ /SearchParseException/ && params[:query]
     flash[:error] = "Sorry, your blank query is invalid..."
    else
     # ... handle other possible situations ...
    end
    redirect_to :back
  end
  
  # GET /pleadings
  # GET /pleadings.json
  def index    
    @search = Pleading.ransack(params[:q])
    @pleadings = @search.result.page(params[:page]) 
    
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pleadings }
    end
  end

  # GET /pleadings/1
  # GET /pleadings/1.json
  def show
    @pleading = Pleading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pleading }
    end
  end

  # GET /pleadings/new
  # GET /pleadings/new.json
  def new
    @pleading = Pleading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pleading }
    end
  end

  # GET /pleadings/1/edit
  def edit
    @pleading = Pleading.find(params[:id])
  end

  # POST /pleadings
  # POST /pleadings.json
  def create
    @pleading = Pleading.new(params[:pleading])

    respond_to do |format|
      if @pleading.save
        format.html { redirect_to @pleading, notice: 'Pleading was successfully created.' }
        format.json { render json: @pleading, status: :created, location: @pleading }
      else
        format.html { render action: "new" }
        format.json { render json: @pleading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pleadings/1
  # PUT /pleadings/1.json
  def update
    @pleading = Pleading.find(params[:id])

    respond_to do |format|
      if @pleading.update_attributes(params[:pleading])
        format.html { redirect_to @pleading, notice: 'Pleading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pleading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pleadings/1
  # DELETE /pleadings/1.json
  def destroy
    @pleading = Pleading.find(params[:id])
    @pleading.destroy

    respond_to do |format|
      format.html { redirect_to pleadings_url }
      format.json { head :no_content }
    end
  end
  
  def pleadings_ransack
    @q = Pleading.ransack(params[:q])
    @pleadings = @q.result(distinct:true).page(params[:page])
  end
  
  def pleadings_search
    @pleadings = Pleading.search(params)    
  end
end
