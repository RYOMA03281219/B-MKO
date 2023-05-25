class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
  end

  def edit
  end

  def update
  end
end
