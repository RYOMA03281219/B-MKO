class Admin::HomesController < ApplicationController

  def top
    @items = Item.all.page(params[:page]).per(5)
  end

   def index
    @categories = Category.where(id: Category.pluck(:ancestry).compact.map { |e| e.split('/') }.flatten.uniq)
  end
end
