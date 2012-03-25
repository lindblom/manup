#coding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?
  
  private
  def admin?
    session[:is_admin]
  end
  
  def require_admin
    redirect_to( login_path, alert: "Du måste logga in!") unless admin?
  end
end
