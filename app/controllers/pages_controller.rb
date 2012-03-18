class PagesController < ApplicationController
  def index
    @essays = Essay.all
  end
end
