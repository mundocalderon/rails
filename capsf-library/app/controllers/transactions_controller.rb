class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /transactions
  # GET /transactions.json
  def index
    #@transactions = Transaction.all
    @search = Transaction.search(params[:q])
    @transactions = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def checkout
    #do you have a book checked out already?
    @transaction = Transaction.where("user_id = ? and book_id = ? and date_of_return is null and date_of_issue is not null ", current_user.id, params[:id]).last
    book = Book.find_by_id(params[:id])
    
    if !@transaction.nil?
      flash[:notice] = "You have already checked out this book. You need to return it before checking it out again."
    elsif book.copies_available > 0
      @transaction = Transaction.new(:date_of_issue => Time.now.strftime("%Y-%m-%d"), :user_id => current_user.id, :book_id => params[:id])
      if @transaction.save  
        flash[:notice] = 'Book transaction was successfully created.' 
      end
    else
      flash[:notice] = "There aren't any available copies of this book."
    end
    redirect_to books_path
    
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def return
    #returns true if user has checked out this book.
    @transaction = Transaction.where("user_id = ? and book_id =? and date_of_issue is not null", current_user.id, params[:id]).last
    
    #search returned false and user hasn't ever checked out book
    if @transaction.nil?
      flash[:notice] = "You have to Check Out the book before returning it!"
    elsif @transaction.date_of_return #date_of_return isn't empty so the book has been returned already.
      flash[:notice] = "You have already returned this book"
    else #has and date_of_issue but no date_of_return so they must be returning it.
      @transaction.update_attributes(:date_of_return => Time.now.strftime("%Y-%m-%d") )
      flash[:notice] = "Success! Thank you for returning the book."
    end
    redirect_to books_path
  end
  
  def history
    #@users_books = Book.issued.by_user(current_user.id)
    #@users_transactions = Transaction.find_all_by_user_id(current_user.id)  
    @users_books = Book.joins(:transactions).where('user_id = ? and date_of_issue is not null and date_of_return is null', current_user.id)
    @users_transactions = Transaction.find_all_by_user_id(current_user.id) 
    
  end
  
  def create
    @transaction = Transaction.new(params[:transaction])
    
    respond_to do |format|
      if @transaction.save
        format.html {redirect_to transactions_path}
      else
        format.html {render action:"new"}
      end
    end
  end
  
  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
