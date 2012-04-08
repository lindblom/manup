#coding:UTF-8
class Admin::ResourcesController < ApplicationController
  before_filter :require_admin
  
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
  
  def edit
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(params[:resource])
      redirect_to resources_path, notice: "Resursen är uppdaterad."
    else
      render :update
    end
  end
  
  def destroy
    Resource.find(params[:id]).destroy
    redirect_to resources_path, notice: "Resursen borttagen"
  end
end
