class EssaysController < ApplicationController
  def show
    @essay = Essay.find(params[:id])
  end
end
