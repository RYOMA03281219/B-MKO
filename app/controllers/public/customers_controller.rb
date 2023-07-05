class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update!(customer_params)
      redirect_to customers_path
    else
      render "edit"
    end
  end

  def cancellation
    @customer = current_customer
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_delete: true)
    reset_session
    flash[:notice] = "またのご利用お待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :postal_code, :address, :telephone_number, :star)
  end
end
