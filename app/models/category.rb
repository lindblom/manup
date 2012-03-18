class Category < ActiveRecord::Base
  before_validation :create_slug, on: :create
  
  has_many :essays
  
  private
    def create_slug
      self.slug = title.parameterize 
    end
end
