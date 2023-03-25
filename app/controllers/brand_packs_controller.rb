class BrandPacksController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    if params[:sort] == "true"
      @packs = Pack.alphabetize
    else
      @packs = @brand.packs
    end
  end

  def new
    @brand = Brand.find(params[:brand_id])
  end

  def create
    if params[:Waterproof] == "true"
      wproof = true
    else
      wproof = false
    end
    Pack.create(
      name: params[:Name],
      liters: params[:Liters],
      waterproof: wproof,
      brand_id: params[:brand_id])
  end

  def alphabetize
    
  end
end
