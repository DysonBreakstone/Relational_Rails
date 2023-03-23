class BrandPacksController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @packs = @brand.packs
  end
end
