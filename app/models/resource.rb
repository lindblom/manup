class Resource < ActiveRecord::Base
  
  scope :podcasts, where(category: "Podcast")
  scope :books, where(category: "Book")
  scope :latest, order("created_at DESC").limit(3)
end
