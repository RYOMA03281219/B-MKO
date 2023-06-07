class Public::PasswordResetsController < ApplicationController
  def new
  end

  def edit
  end
  
  def create
    @customer = Customer.find_by(email: params[:password_reset][:email].downcase)
    if  @customer
      @customer.create_reset_digest
      @customer.send_password_reset_email
      flash[:info] = "パスワード再設定リンク付きのメールを送信しました"
      redirect_to root_url
    else
      flash.now[:danger] = "メールアドレスが不正です"
      render 'new'
    end
  end
    
end
