class Admin::ResourcesController < ApplicationController
  def new
    @resource = Resource.new
  end
  
  def create
    if @resource = Resource.create(params[:resource])
      redirect_to resources_path, notice: "Din resurs har lagts till"
    else
      render :new
    end
  end
  
  def destroy
    Resource.find(params[:id]).destroy
    redirect_to resources_path, notice: "Resursen borttagen"
  end
end
