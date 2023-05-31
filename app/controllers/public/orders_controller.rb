class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @orders = current_customer.orders.new
  end

  def confirm
    @customer = current_customer
    @order = current_customer.order.all
    @order_details = @order.order_details
    @order_count = Order.all.count
    @total = (@order.inject(0) {|sum, order| sum + order.subtotal}) + @postage
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:address_id] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
  end

  def completion
    @customer = current_customer
  end

  def create
    @order = Order.new(current_params)
    @order.customer_id = current_customer.id
    if @order.save!
      current_customer.orders.each do |order|
        order_detail = OrderDetail.new
        order_detail.amount = order.amount
        order_detail.item_id = order.item_id
        order_detail.purchase_price = order.item.price * 1.1
        order_detail.save
      end
    end
  end

  def index
    @customer = current_customer
    @orders = current_customer.orders.all
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = (@order_details.inject(0) {|sum, order_details| sum + order_details.subtotal})
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postage, :billing_amount)
  end
end
