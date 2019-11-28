class PleadKeywordsController < ApplicationController
  before_filter :has_super_admin_role
  
  # GET /plead_keywords
  # GET /plead_keywords.json
  def index
    @plead_keywords = PleadKeyword.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plead_keywords }
    end
  end

  # GET /plead_keywords/1
  # GET /plead_keywords/1.json
  def show
    @plead_keyword = PleadKeyword.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plead_keyword }
    end
  end

  # GET /plead_keywords/new
  # GET /plead_keywords/new.json
  def new
    @plead_keyword = PleadKeyword.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plead_keyword }
    end
  end

  # GET /plead_keywords/1/edit
  def edit
    @plead_keyword = PleadKeyword.find(params[:id])
  end

  # POST /plead_keywords
  # POST /plead_keywords.json
  def create
    @plead_keyword = PleadKeyword.new(params[:plead_keyword])

    respond_to do |format|
      if @plead_keyword.save
        format.html { redirect_to @plead_keyword, notice: 'Plead keyword was successfully created.' }
        format.json { render json: @plead_keyword, status: :created, location: @plead_keyword }
      else
        format.html { render action: "new" }
        format.json { render json: @plead_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plead_keywords/1
  # PUT /plead_keywords/1.json
  def update
    @plead_keyword = PleadKeyword.find(params[:id])

    respond_to do |format|
      if @plead_keyword.update_attributes(params[:plead_keyword])
        format.html { redirect_to @plead_keyword, notice: 'Plead keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plead_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plead_keywords/1
  # DELETE /plead_keywords/1.json
  def destroy
    @plead_keyword = PleadKeyword.find(params[:id])
    @plead_keyword.destroy

    respond_to do |format|
      format.html { redirect_to plead_keywords_url }
      format.json { head :no_content }
    end
  end
end
