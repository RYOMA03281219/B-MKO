class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.page(params[:page]).per(5)
  end
end
