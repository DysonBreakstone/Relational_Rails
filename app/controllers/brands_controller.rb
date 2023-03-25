class BrandsController < ApplicationController
  def index
    @brands = Brand.alphabetized
  end

  def show
    # require 'pry'; binding.pry
    @brand = Brand.find(params[:id])
    @pack_number = @brand.count_packs
  end

  def new
  end

  def create
    if params[:Backpacks_Only] == "true"
        packs_only = true
      else
        packs_only = false
    end
    Brand.create(
      name:params[:Name], 
      founded:params[:Founded],
      backpacks_only: packs_only)
    redirect_to '/brands'
  end

  def edit
    @brand = Brand.find(params[:brand_id])
  end

  def update
    if params[:Backpacks_Only] == "true"
      packs_only = true
    else
      packs_only = false
    end
    
    @brand = Brand.find(params[:brand_id])
    @brand.update(
      name: params[:Name],
      founded: params[:Founded],
      backpacks_only: packs_only 
    )
    redirect_to "/brands/#{@brand.id}"
  end
end