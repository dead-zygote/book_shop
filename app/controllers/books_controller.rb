# coding: utf-8
class BooksController < ApplicationController
  before_filter do
    @cart_item = CartItem.new(quantity: 1)
  end
  
  def index
    session[:page] = params[:page]
    session[:field] = params[:field]
    session[:direction] = params[:direction]
    session[:search] = params[:search]
    session[:author_id] = params[:author_id]
    session[:publisher_id] = params[:publisher_id]
    session[:category_id] = params[:category_id]
    
    if params[:search]
      ids = Book.search_for_ids(params[:search])
      @books = Book.where('id in (?) and available is true', ids).page(params[:page])
    elsif params[:author_id]
      @author = Author.find(params[:author_id])
      @books = @author.books.where(available: true).order('title').page(params[:page]).includes(:authors)
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @books = @category.books.where(available: true).order('title').page(params[:page]).includes(:authors)
    elsif params[:publisher_id]
      @publisher = Publisher.find(params[:publisher_id])
      @books = @publisher.books.where(available: true).order('title').page(params[:page]).includes(:authors)
    else
      @sorting = sorting_by('title', 'created_at')
      @books = Book.where(available: true).order(@sorting).page(params[:page]).includes(:authors)
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @cart_item = CartItem.new(book_id: @book.id, quantity: 1)
  end
end
