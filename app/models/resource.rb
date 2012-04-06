class Resource < ActiveRecord::Base
  
  scope :podcasts, where(category: "Podcast")
  scope :books, where(category: "Book")
end
