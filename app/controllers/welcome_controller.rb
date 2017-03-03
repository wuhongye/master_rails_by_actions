class WelcomeController < ApplicationController
  
  def index
    @categories = Category.grouped_data
    @products = Product.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 12).order("id desc")
  end

end
