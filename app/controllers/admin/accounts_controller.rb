class Admin::AccountsController < ApplicationController


  def new
     @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to root_url, notice: "welcome"
    else
      render :new
      flash[:warning] = "please..."
    end

  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation)
  end
end
