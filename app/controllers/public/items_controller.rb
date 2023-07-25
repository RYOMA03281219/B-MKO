class Public::ItemsController < ApplicationController
  def index
    @customer = current_customer
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save
      redirect_to item_path(@item.id)
    else
      flash[:alert] = "※画像ファイルの拡張子もしくは記入項目が空欄です。※"
      render "new"
    end
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @genre = @item.genre
    @post_comment = PostComment.new
  end

  def edit
    @item = Item.find(params[:id])
    @customer = current_customer
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to customers_my_page_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :review, :favorite, :image, :star, :post_comment)
  end
end
