class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.create!(params[:comment])    
    flash[:notice] = "Thanks for commenting!"
    respond_to do |format|
      #format.html { redirect_to comments_path }
      format.js
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #format.html { redirect_to comments_url }
      format.js
    end
  end
end
