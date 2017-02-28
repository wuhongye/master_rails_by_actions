class Category < ApplicationRecord

  validates :title, presence: { message: "名称不能为空" }

  has_ancestry

  has_many :products, dependent: :destroy
  
end
