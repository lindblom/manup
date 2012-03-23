class EssaysController < ApplicationController
  def show
    @essay = Essay.find_by_slug(params[:id])
  end
end
