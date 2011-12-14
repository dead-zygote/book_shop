# coding: utf-8
class Admin::PublishersController < AdminController
  def index
    @publishers = Publisher.order('name').all
    @publisher = Publisher.new
  end
  
  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      redirect_to admin_publishers_path, notice: "Вы добавили издательство #{@publisher.name}."
    else
      render 'index'
    end
  end
  
  def edit
    @publisher = Publisher.find(params[:id])
  end
  
  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:id])
      redirect_to admin_publishers_path, notice: 'Вы изменили информацию об издательстве.'
    else
      render 'edit'
    end
  end
end
