# coding: utf-8
class Admin::AuthorsController < AdminController
  def index
    @sorting = sorting_by('id', 'name')
    @authors = Author.order(@sorting).page(params[:page])
  end
  
  def edit
    @author = Author.find(params[:id])
  end
  
  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to admin_authors_path, notice: 'Вы изменили информацию об авторе.'
    else
      render 'edit'
    end
  end
end
