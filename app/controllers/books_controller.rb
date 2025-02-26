class BooksController < ApplicationController
  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params) 
    @book.user_id = current_user.id 
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  
  def edit  
  @book = Book.find(params[:id])
   if @book.user == current_user
        render "edit"
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      if @book.errors[:title].include?("can't be blank")
        flash[:alert] = "Title can't be blank"
    else
      flash[:alert] = "Failed to update the book. Please check the errors."
    end
      render :edit
    end
  end
  
  def destroy
  @book = Book.find(params[:id])
  if @book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end
end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end   
end
