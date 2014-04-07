class ArticleDecorator < Draper::Decorator
  ### When your decorator calls delegate_all, any method called on the decorator not defined in the 
  ### decorator itself will be delegated to the decorated object. 
  ### This is a very permissive interface.

  # delegate_all

  ###  If you want to strictly control which methods are called within views, 
  ###  you can choose to only delegate certain methods from the decorator to the source model:
  delegate :title
  
  decorates_finders
  
  def recent_articles
    title
  end

  def publication_status
    if object.published?
      "Published"
    else
      "Unpublished"
    end
  end

  def published_at
    object.published_at.strftime("%A, %B %e")
  end

  def publish
    if object.published?
      h.link_to "Unpublish" 
    else
      h.link_to "Publish" 
    end
  end
end
