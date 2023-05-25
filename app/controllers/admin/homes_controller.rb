class Admin::HomesController < ApplicationController

  def top
    @order = Order.all.page(params[:page]).per(5)
  end
end
