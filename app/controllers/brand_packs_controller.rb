class BrandPacksController < ApplicationController
  
  def index
    @brand = Brand.find(params[:brand_id])
    @packs = if params[:liter_threshold].nil? 
                Pack.all
             else
                Pack.filter_liters(params[:liter_threshold])
             end
    @packs = @packs.alphabetize if params[:sort] == "true"
  end

  def filter_params
    params.permit(:filter)
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
end
