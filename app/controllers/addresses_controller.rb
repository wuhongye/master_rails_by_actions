class AddressesController < ApplicationController
  
  layout false
  before_action :auther_user

  def index
    @addrsses = current_user.addrsses.order("id desc")
  end

  def set_default_address
    
  end
  
end
