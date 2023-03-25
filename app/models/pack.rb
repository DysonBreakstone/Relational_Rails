class Pack < ApplicationRecord
  belongs_to :brand

  def self.filter_for_true
    Pack.where(waterproof: true)
  end
end