# coding: utf-8
class CartItemsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  def index
    @cart_items = @cart.items
  end
  
  def create
    @book = Book.find(params[:cart_item][:book_id])
    @cart_item = @cart.items.create!(params[:cart_item])
    respond_to do |format|
      format.html do
        flash[:notice] =  "В вашу корзину добавлена книга «#{@book.title}»"
        redirect_to :back
      end
      format.json do
        render json: { 
          cart_price: number_to_currency(@cart.price),
          quantity: @cart_item.quantity,
          price: number_to_currency(@book.price),
          id: @cart_item.id
        }
      end
    end
  end
  
  def destroy
    @cart_item = @cart.items.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Вы убрали книгу из корзины" }
      format.json do
        render json: {
          cart_price: number_to_currency(@cart.price),
          book_id: @cart_item.book_id,
          price: number_to_currency(@cart_item.book.price)
        }
      end
    end
  end
  
  def destroy_all
    @cart.items.each &:destroy
    redirect_to cart_items_path, notice: 'Вы очистили корзину'
  end
end
