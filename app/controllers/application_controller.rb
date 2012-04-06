#coding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ensure_domain
  
  helper_method :admin?
  
  private
  
  def ensure_domain
    redirect_to "http://#{ENV['DOMAIN']}#{request.path}" if ENV['DOMAIN'] && request.host != ENV['DOMAIN']
  end
  
  def admin?
    session[:is_admin]
  end
  
  def require_admin
    redirect_to( login_path, alert: "Du måste logga in!") unless admin?
  end
end
