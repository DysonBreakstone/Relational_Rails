class Brand < ApplicationRecord
  has_many :packs

  def self.alphabetized
    Brand.order(:created_at).reverse_order
  end

  def self.count_packs

  end
end