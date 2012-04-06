class ResourcesController < ApplicationController
  def index
    @books = Resource.books
    @podcasts = Resource.podcasts
  end
end
