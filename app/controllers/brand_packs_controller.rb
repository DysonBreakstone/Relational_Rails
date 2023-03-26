class BrandPacksController < ApplicationController
  
  def index
    @brand = Brand.find(params[:brand_id])
    if params[:liter_threshold] != nil && params[:sort] == "true"
      @packs = @brand.packs.filter_liters(params[:liter_threshold]).alphabetize
    elsif params[:liter_threshold] != nil && params[:sort] != "true"
      @packs = @brand.packs.filter_liters(params[:liter_threshold])
    elsif params[:liter_threshold] == nil && params[:sort] == "true"
      @packs = @brand.packs.alphabetize
    else
      @packs = @brand.packs
    end
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

  def alphabetize
    
  end
end
