class PagesController < ApplicationController
  def index
    @latest_essays = Essay.latest
    @essay_count = Essay.published.count
    @podcasts_count = Resource.podcasts.count
    @podcasts = Resource.latest.podcasts
    @books_count = Resource.books.count
    @books = Resource.latest.books
  end
  
  def sitemap
    @pages = []
    
    @pages << { url: root_url, changefreq: "daily", priority: 1 }
    @pages << { url: essays_url }
    @pages << { url: resources_url }
    
    Essay.published.each { |essay| @pages << { url: essay_url(essay) } }
    
    respond_to do |format|
      format.xml # sitemap.xml.builder
    end
  end
end
