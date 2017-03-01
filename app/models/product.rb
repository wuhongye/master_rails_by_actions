class Product < ApplicationRecord

  validates :category_id, presence: {message: "分类不能为空"} 
  validates :title, presence: {message: "名称不能为空"} 
  validates :status, presence: {message: "分类不能为空"} 

  belongs_to :category

  after_create :set_default_attrs


  private
  def set_default_attrs
    self.uuid = RandomCode.generate_product_uuid
  end
end


