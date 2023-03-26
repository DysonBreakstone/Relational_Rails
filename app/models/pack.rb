class Pack < ApplicationRecord
  belongs_to :brand

  def self.filter_for_true
    Pack.where(waterproof: true)
  end

  def self.alphabetize
    Pack.order('LOWER(name)')
  end

  def self.filter_liters(threshold)
    Pack.where("liters >= #{threshold}")
  end
end