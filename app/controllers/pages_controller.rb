class PagesController < ApplicationController
  def index
    @latest_essays = Essay.latest
    @essay_count = Essay.published.count
    @podcasts_count = Resource.podcasts.count
    @books_count = Resource.books.count
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
