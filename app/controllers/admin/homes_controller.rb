class Admin::HomesController < ApplicationController

  def top
    @items = Item.all.page(params[:page]).per(5)
  end
end
