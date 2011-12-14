# coding: utf-8
class Admin::CategoriesController < AdminController
  def index
    @sorting = sorting_by('id', 'name')
    @categories = Category.order(@sorting).page(params[:page])
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, notice: 'Вы изменили раздел.'
    else
      render 'edit'
    end
  end
end
