#coding:UTF-8
class SessionsController < ApplicationController
  
  def create
    if params[:login][:username] == ENV["admin_user"] && params[:login][:password] == ENV["admin_password"]
      session[:is_admin] = true
      redirect_to root_path, notice: "Du är nu inloggad som admin."
    else
      flash.now.alert = "Felaktiga uppgifter angivna."
      render :new
    end
  end
  
  def destroy
    session[:is_admin] = nil
    redirect_to root_path, notice: "Du har nu blivit utloggad"
  end
end
