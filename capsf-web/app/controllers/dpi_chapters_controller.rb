class DpiChaptersController < ApplicationController
  before_filter :has_super_admin_role
  
  # GET /dpi_chapters
  # GET /dpi_chapters.json
  def index
    @dpi_chapters = DpiChapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dpi_chapters }
    end
  end

  # GET /dpi_chapters/1
  # GET /dpi_chapters/1.json
  def show
    @dpi_chapter = DpiChapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dpi_chapter }
    end
  end

  # GET /dpi_chapters/new
  # GET /dpi_chapters/new.json
  def new
    @dpi_chapter = DpiChapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dpi_chapter }
    end
  end

  # GET /dpi_chapters/1/edit
  def edit
    @dpi_chapter = DpiChapter.find(params[:id])
  end

  # POST /dpi_chapters
  # POST /dpi_chapters.json
  def create
    @dpi_chapter = DpiChapter.new(params[:dpi_chapter])

    respond_to do |format|
      if @dpi_chapter.save
        format.html { redirect_to @dpi_chapter, notice: 'Dpi chapter was successfully created.' }
        format.json { render json: @dpi_chapter, status: :created, location: @dpi_chapter }
      else
        format.html { render action: "new" }
        format.json { render json: @dpi_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dpi_chapters/1
  # PUT /dpi_chapters/1.json
  def update
    @dpi_chapter = DpiChapter.find(params[:id])

    respond_to do |format|
      if @dpi_chapter.update_attributes(params[:dpi_chapter])
        format.html { redirect_to @dpi_chapter, notice: 'Dpi chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dpi_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dpi_chapters/1
  # DELETE /dpi_chapters/1.json
  def destroy
    @dpi_chapter = DpiChapter.find(params[:id])
    @dpi_chapter.destroy

    respond_to do |format|
      format.html { redirect_to dpi_chapters_url }
      format.json { head :no_content }
    end
  end
end
