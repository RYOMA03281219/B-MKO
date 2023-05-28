class Public::HomesController < ApplicationController
  def top
    @recommend_items = Item.last(4)
    @genres= Genre.all
  end

end
