class Admin::ProductImagesController < Admin::BaseController
  
  def index
    @product = Product.find(params[:id])
    @product_images = @product.product_images
  end

  def create
    
  end

  def destroy
    
  end

end