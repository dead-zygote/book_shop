# coding: utf-8
class CustomerController < ApplicationController
  before_filter :authenticate_user!, :require_customer!
  
  def require_customer!
    if current_user.admin?
      redirect_to root_path, alert: 'Вы хотели войти в раздел, доступный только для покупателей'
    end
  end
end
