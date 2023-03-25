class Brand < ApplicationRecord
  has_many :packs

  def self.sorted
    Brand.order(:created_at).reverse_order
  end

  def count_packs
    Pack.where(brand_id: id).count
  end
end