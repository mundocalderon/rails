class SubcategoriesController < ApplicationController
    before_filter :authenticate_user!
    before_filter :has_super_admin_role, :only => [ :index, :edit, :update, :destroy, :create]

  # GET /subcategories
  # GET /subcategories.json
    def index
      @subcategories = Subcategory.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @subcategories }
      end
    end

    def show
      @subcategory = Subcategory.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @subcategories }
      end
    end


    def new
      @subcategory = Subcategory.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @subcategory }
      end
    end

    def edit
      @subcategory = Subcategory.find(params[:id])
    end


    def create
      @subcategory = Subcategory.new(params[:subcategory])

      respond_to do |format|
        if @subcategory.save
          format.html { redirect_to new_subcategory_path, notice: 'subcategory was successfully created.' }
          format.json { render json: @subcategory, status: :created, location: @subcategory }
        else
          format.html { render action: "new" }
          format.json { render json: @subcategory.errors, status: :unprocessable_entity }
        end
      end
    end


    def update
      @subcategory = Subcategory.find(params[:id])

      respond_to do |format|
        if @subcategory.update_attributes(params[:subcategory])
          format.html { redirect_to @subcategory, notice: 'subcategory was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @subcategory.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @subcategory = Subcategory.find(params[:id])
      @subcategory.destroy

      respond_to do |format|
        format.html { redirect_to subcategories_url }
        format.json { head :ok }
      end
    end
end

