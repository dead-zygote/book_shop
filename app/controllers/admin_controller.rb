# coding: utf-8
class AdminController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :require_admin!
  skip_before_filter :initialize_cart
  
  def require_admin!
    puts current_user.email
    unless current_user.admin?
      render 'public/403.html', status: 403, layout: false
    end
  end
end
