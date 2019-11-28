class PleadCategoriesController < ApplicationController
  before_filter :has_super_admin_role
  
  # GET /plead_categories
  # GET /plead_categories.json
  def index
    @plead_categories = PleadCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plead_categories }
    end
  end

  # GET /plead_categories/1
  # GET /plead_categories/1.json
  def show
    @plead_category = PleadCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plead_category }
    end
  end

  # GET /plead_categories/new
  # GET /plead_categories/new.json
  def new
    @plead_category = PleadCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plead_category }
    end
  end

  # GET /plead_categories/1/edit
  def edit
    @plead_category = PleadCategory.find(params[:id])
  end

  # POST /plead_categories
  # POST /plead_categories.json
  def create
    @plead_category = PleadCategory.new(params[:plead_category])

    respond_to do |format|
      if @plead_category.save
        format.html { redirect_to @plead_category, notice: 'Plead category was successfully created.' }
        format.json { render json: @plead_category, status: :created, location: @plead_category }
      else
        format.html { render action: "new" }
        format.json { render json: @plead_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plead_categories/1
  # PUT /plead_categories/1.json
  def update
    @plead_category = PleadCategory.find(params[:id])

    respond_to do |format|
      if @plead_category.update_attributes(params[:plead_category])
        format.html { redirect_to @plead_category, notice: 'Plead category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plead_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plead_categories/1
  # DELETE /plead_categories/1.json
  def destroy
    @plead_category = PleadCategory.find(params[:id])
    @plead_category.destroy

    respond_to do |format|
      format.html { redirect_to plead_categories_url }
      format.json { head :no_content }
    end
  end
end
