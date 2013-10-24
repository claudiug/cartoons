class SessionsController < ApplicationController


  def new
  end

  def create
    account = Account.find(email: params[:email])
    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to admin_dashboard_path, notice:"welcome #{account.username}"
    else
      flash.now.warning = "fix the errors"
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path
  end
end
