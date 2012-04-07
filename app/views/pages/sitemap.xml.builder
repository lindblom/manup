xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @pages.each do |page|
    xml.url do
      xml.loc page[:url]
      xml.lastmod page[:lastmod] if page[:lastmod]
      xml.priority page[:priority] if page[:priority]
    end
  end
end