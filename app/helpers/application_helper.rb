module ApplicationHelper
  
  def set_title(title)
    content_for :title do
      title
    end
  end
  
  def set_description(description)
    content_for :description do
      description
    end
  end
end
