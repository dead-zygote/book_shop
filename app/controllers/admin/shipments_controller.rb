# coding: utf-8
class Admin::ShipmentsController < AdminController
  before_filter :find_order
  
  def new
    @shipment = @order.shipments.build
  end
  
  def create
    @shipment = @order.shipments.build(params[:shipment])
    if @shipment.save
      redirect_to [:admin, @order]
    else
      render :new
    end
  end
  
  def edit
    @shipment = @order.shipments.find(params[:id])
  end
  
  def update
    @shipment = @order.shipments.find(params[:id])
    if @shipment.update_attributes(params[:shipment])
      redirect_to [:admin, @order]
    else
      render 'edit'
    end
  end
  
  def destroy
    @shipment = @order.shipments.find(params[:id])
    @shipment.destroy
    redirect_to [:admin, @order]
  end
  
  protected
  
  def find_order
    @order = Order.find(params[:order_id])
  end
end
