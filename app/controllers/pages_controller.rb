class PagesController < ApplicationController
  def index
    @latest_essays = Essay.latest
    @essay_count = Essay.published.count
    @podcasts_count = Resource.podcasts.count
    @books_count = Resource.books.count
  end
end
