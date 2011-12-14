# coding: utf-8
class Admin::CustomersController < AdminController
  def index
    @sorting = sorting_by('id', 'email', 'created_at')
    @customers = User.where(admin: false).order(@sorting).page(params[:page])
  end
  
  def show
    @customer = User.where(admin: false).find(params[:id])
    @orders = @customer.orders.page(params[:page])
  end
end
