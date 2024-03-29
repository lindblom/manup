class Admin::EssaysController < ApplicationController
  before_filter :require_admin
  
  def new
    @essay = Essay.new
  end
  
  def edit
    @essay = Essay.find_by_slug(params[:id])
  end
  
  def destroy
    @essay = Essay.find_by_slug(params[:id])
    if @essay.destroy
      redirect_to root_path
    else
      redirect_to @essay
    end
  end
  
  def update
    @essay = Essay.find_by_slug(params[:id])
    if @essay.update_attributes(params[:essay])
      redirect_to @essay
    else
      render :edit
    end
  end
  
  def create
    @essay = Essay.new(params[:essay])
    if @essay.save
      redirect_to @essay
    else
      render :new
    end
  end
end
