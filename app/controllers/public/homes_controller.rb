class Public::HomesController < ApplicationController
  def top
    @recommend_items = Item.last(3)
    @genres= Genre.all
  end

end
