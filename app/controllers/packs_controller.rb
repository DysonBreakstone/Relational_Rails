class PacksController < ApplicationController
  def index
    @packs = Pack.all
    @visible_packs = @packs.filter_for_true
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

  def delete
    Pack.destroy(params[:id])
    redirect_to "/pack_table_name"
  end


end