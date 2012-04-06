class Essay < ActiveRecord::Base
  
  scope :published, where(published: true)
  scope :latest, published.order("created_at DESC").limit(3)
  
  validates :body,  presence: true
  validates :slug,  presence: true,
                    uniqueness: true
  validate :should_have_an_ingress
  
  before_validation :create_slug
  
  def title
    return nokogiri_body.css("h1").first.try(:text)
  end
  
  def ingress
    return nokogiri_body.css("p").first.try(:text)
  end
  
  def to_html
    return "" unless body
    RDiscount.new(body).to_html
  end
  
  def to_param
    slug
  end
  
  private
  
    def should_have_an_ingress
      errors.add(:body, "should have an ingress") unless ingress
    end
    
    def create_slug
      self.slug = self.title.try(:parameterize)
    end
    
    def nokogiri_body
      Nokogiri::HTML(to_html)
    end
end
