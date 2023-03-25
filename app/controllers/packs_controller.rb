class PacksController < ApplicationController
  def index
    @packs = Pack.all
  end

  def show
    @pack = Pack.find(params[:id])
  end

  def edit
    @pack = Pack.find(params[:id])
  end

  def update
    @pack = Pack.find(params[:id])

    if params[:Waterproof] == "true"
      wproof = true
    else
      wproof = false
    end
    
    @pack.update(
      name: params[:Name],
      liters: params[:Liters],
      waterproof: wproof)
  end

end