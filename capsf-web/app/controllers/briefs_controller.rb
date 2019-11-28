class BriefsController < ApplicationController
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
  
  # GET /briefs
  # GET /briefs.json
  def index
    @q = Brief.ransack(params[:q])
    @briefs = @q.result.page(params[:page])
    @q.build_sort if @q.sorts.empty?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @briefs }
    end
  end

  # GET /briefs/1
  # GET /briefs/1.json
  def show
    @brief = Brief.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brief }
    end
  end

  # GET /briefs/new
  # GET /briefs/new.json
  def new
    @brief = Brief.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brief }
    end
  end

  # GET /briefs/1/edit
  def edit
    @brief = Brief.find(params[:id])
  end

  # POST /briefs
  # POST /briefs.json
  def create
    @brief = Brief.new(params[:brief])

    respond_to do |format|
      if @brief.save
        format.html { redirect_to @brief, notice: 'Brief was successfully created.' }
        format.json { render json: @brief, status: :created, location: @brief }
      else
        format.html { render action: "new" }
        format.json { render json: @brief.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /briefs/1
  # PUT /briefs/1.json
  def update
    @brief = Brief.find(params[:id])

    respond_to do |format|
      if @brief.update_attributes(params[:brief])
        format.html { redirect_to @brief, notice: 'Brief was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brief.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /briefs/1
  # DELETE /briefs/1.json
  def destroy
    @brief = Brief.find(params[:id])
    @brief.destroy

    respond_to do |format|
      format.html { redirect_to briefs_url }
      format.json { head :no_content }
    end
  end
  
  def briefs_ransack
    @q = Brief.ransack(params[:q])
    @briefs = @q.result(distinct:true).page(params[:page])
  end
  
  def briefs_search
    @briefs = Brief.search(params)
  end
  
end
