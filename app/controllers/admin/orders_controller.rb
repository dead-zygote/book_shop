# coding: utf-8
class Admin::OrdersController < AdminController
  def index
    if params[:state]
      if Order::STATES.include? params[:state]
        @orders = Order.where(state: params[:state]).page(params[:page])
      else
        render_404
      end
    else
      @sorting = sorting_by('id', 'price', 'created_at', 'state')
      @orders = Order.order(@sorting).page(params[:page])
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @shipments = @order.shipments
  end
  
  def update
    @order = Order.find(params[:id])
    current_state = @order.state
    @order.state = params[:state]
    if @order.save
      flash[:notice] = 'изменения сохранены'
      redirect_to [:admin, @order]
    else
      flash.now[:alert] = 'состояние заказа не может быть изменено'
      @order.state = current_state
      @shipments = @order.shipments
      render 'show'
    end
  end
  
  def destroy
  end
end
