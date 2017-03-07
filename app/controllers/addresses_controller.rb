class AddressesController < ApplicationController
  
  layout false
  before_action :auther_user

  def index
    @addrsses = current_user.addrsses
  end

  def new
    @address = current_user.addrsses.new
  end

  def create
    @address = current_user.addrsses.new(address_params)
    if @address.save
      @addresses = current_user.reload.addrsses
      render json{
        status: 'ok',
        data: render_to_string(file: 'addresses/index')
      }
    else
      render json: {
        status: 'error'
        data: render_to_string(file: 'addresses/new')
      }
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
    render action: :new    
  end

  def update
    @address = current_user.addresses.find(params[:id])
    @address.attributes = address_params
    if @address.save
      @addresses = current_user.reload.addresses
      render json: {
        status: 'ok',
        data: render_to_string(file: 'addresses/index')
      }
    else
      render json: {
        
      }
    end
  end

  def set_default_address
    
  end
  
  private
  def address_params
    params.require(:addrss).permit(:contact_name, :cellphone, :address,
      :zipcode, :set_as_default)
  end
end
