# coding: utf-8
class AddressesController < CustomerController
  def index
    @addresses = current_user.addresses
  end
  
  def new
    @address = current_user.addresses.build
  end
  
  def create
    @address = current_user.addresses.build(params[:address])
    if @address.save
      redirect_to addresses_path, notice: 'Вы добавили новый адрес'
    else
      render 'new'
    end
  end
  
  def edit
    @address = current_user.addresses.find(params[:id])
  end
  
  def update
    @address = current_user.addresses.find(params[:id])
    puts "params[:address][:make_default] == #{params[:address][:make_default]}"
    puts "@address.make_default == #{@address.make_default}"
    if @address.update_attributes(params[:address])
      redirect_to addresses_path, notice: 'Вы изменили адрес'
    else
      render 'edit'
    end
  end
  
  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: 'Вы удалили адрес'
  end
end
