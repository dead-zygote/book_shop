# coding: utf-8
class OrdersController < CustomerController
  before_filter :require_addresses!, only: [:new, :create]

  def index
    @sorting = sorting_by('id', 'created_at', 'price')
    @orders = current_user.orders.order(@sorting).page(params[:page])
  end
  
  def show
    @order = current_user.orders.find(params[:id])
  end
  
  def new
    @order = current_user.orders.build
    for cart_item in @cart.items.includes(:book)
      @order.items.build book: cart_item.book,
                               quantity: cart_item.quantity,
                               price: cart_item.book.price,
                               chosen: true
    end
  end
  
  def create
    @order = current_user.orders.build(params[:order])
    if @order.save
      book_ids = @order.items.map &:book_id
      cart_items = @cart.items.where('book_id in (?)', book_ids)
      cart_items.each &:destroy
      redirect_to @order
    else
      render 'new'
    end
  end
  
  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
  
  protected
  
  def require_addresses!
    if current_user.addresses.empty?
      redirect_to new_address_path, alert: 'чтобы делать заказы, вы должны добавить свой адрес'
    end
  end
end
