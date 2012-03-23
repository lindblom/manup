class Admin::EssaysController < ApplicationController
  def new
    @essay = Essay.new
  end
  
  def edit
    @essay = Essay.find_by_slug(params[:id])
  end
  
  def destroy
    
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
