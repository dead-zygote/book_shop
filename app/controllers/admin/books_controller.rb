# coding: utf-8
class Admin::BooksController < AdminController
  def index
    session[:page] = params[:page]
    session[:field] = params[:field]
    session[:direction] = params[:direction]
    session[:search] = params[:search]
    
    if params[:search]
      @books = Book.search(params[:search], per_page: 20, page: params[:page])
    else
      @sorting = sorting_by('title', 'price', 'quantity', 'available')
      @books = Book.includes(:authors).order(@sorting).page(params[:page])
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to admin_book_path(@book), notice: 'Вы добавили новую книгу.'
    else
      render 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to admin_book_path(@book), notice: 'Вы изменили информацию о книге.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @book = Book.select('id, title').find(params[:id])
    @book.destroy
    redirect_to admin_books_path, notice: "Вы удалили книгу «#{@book.title}»."
  end
end
