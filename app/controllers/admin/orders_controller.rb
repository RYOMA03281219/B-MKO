class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = (@order_details.inject(0) { |sum, order_details| sum + order_details.subtotal })
  end

  # def update
  #   @order = Order.find(params[:id])
  #   if @order.update(order_details_params)
  #     redirect_to admin_order_path(@order.id)
  #   else
  #     render "show"
  #   end
  # end

  private

  def order_details_params
    params.require(:order_details).permit(:purchase_price, :amount, :production_status)
end
