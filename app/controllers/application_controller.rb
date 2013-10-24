class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def auth
    if current_account.nil?
      redirect_to root_path
    end
  end

  helper_method :current_account
end
