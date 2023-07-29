class Public::CustomersController < ApplicationController
  def show
    @customer = if params[:id].present?
      Customer.find(params[:id])
    else
      current_customer
    end
    @customers = Customer.all
    @items = @customer.items
    @item = Item.new
  end

  def edit
    @customer = Customer.find(current_customer.id)
    if current_customer != @customer
      redirect_to customers_my_page_path(current_customer.id)
    end
  end

  def update
    @customer = current_customer
    if @customer.update!(customer_params)
      redirect_to customers_my_page_path(@customer.id)
    else
      render "edit"
    end
  end

  def cancellation
    @customer = current_customer
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_delete: false)
    reset_session
    flash[:notice] = "またのご利用お待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :introduction, :profile_image)
  end

  def ensure_currect_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      flash[:notice] = "権限がありません"
      redirect_to customers_my_page_path(current_customer)
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
