class BrandsController < ApplicationController
  def index
    @brands = Brand.alphabetized
  end
  def show
    @brand = Brand.find(params[:id])
    @pack_number = Brand.count_packs
  end
end