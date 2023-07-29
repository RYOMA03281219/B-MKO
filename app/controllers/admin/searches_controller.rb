class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search_result
    @range = params[:range]
    @search_word = params[:search_word]
    if @range == "Customer"
      @customers = Customer.where("name LIKE?","%#{@search_word}%").where(is_delete: false)
    else
      @items = Item.where("name LIKE?","%#{@search_word}%")
    end
  end
end
