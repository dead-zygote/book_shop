# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_cart
  
  protected
  
  def initialize_cart
    @cart = Cart.find_by_id(cookies[:cart_id])
    if @cart.nil?
      @cart = Cart.create!
      cookies[:cart_id] = { value: @cart.id, expires: 1.week.from_now }
    end
  end
  
  def render_404
    render file: 'public/404.html', status: 404, layout: false
  end
  
  def sorting_by(*fields)
    if params[:field] and params[:direction]
      if fields.include?(params[:field]) and ['asc', 'desc'].include?(params[:direction])
        params[:field] + ' ' + params[:direction]
      else
        render_404
      end
    end
  end
end
