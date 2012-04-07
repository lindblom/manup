class EssaysController < ApplicationController
  def show
    @essay = Essay.find_by_slug(params[:id])
  end
  
  def index
    @essays = Essay.published
    @essays = Essay.all if admin?
  end
end
