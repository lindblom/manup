class Essay < ActiveRecord::Base
  belongs_to :category
  
  validates :category, presence: true
  
  before_validation :create_slug
  
  private
    def create_slug
      self.slug = self.title.parameterize
    end
end
