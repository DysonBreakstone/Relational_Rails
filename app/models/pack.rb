class Pack < ApplicationRecord
  belongs_to :brand

  def self.filter_for_true
    Pack.where(waterproof: true)
  end

  def self.alphabetize
    Pack.order(:name)
  end

  def self.filter_liters(threshold)
    Pack.where("liters >= #{threshold}")
    # require 'pry'; binding.pry
  end
end