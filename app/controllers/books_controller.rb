class BooksController < ApplicationController



  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "投稿がありました"
    else
     render :index


    end

  end

  def index
    @books =Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to bookss_path(@book.id)
      flash[:notice] = "投稿がありました"
    else
        render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集しました"
      redirect_to book_path
    else
      render :show
    end

  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to bookss_path
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end