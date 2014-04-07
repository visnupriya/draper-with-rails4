class UserDecorator < Draper::Decorator
  # delegate_all

  #####################
  # Decorated Finders
  decorates_finders
  #####################

  def username
  	[first_name, last_name].join(' ').capitalize
  end

  def image
  	if object.profile_picture.empty? 
  		check_gender 
    else 
    	h.image_tag(object.profile_picture, height: '50', width: '50')
  	end 
  end

  def twitter
  	handle_none object.twitter_name do
      h.link_to object.twitter_name, "http://twitter.com/#{object.twitter_name}"
    end 
  end

  def github
  	handle_none object.github_name do
      h.link_to object.github_name, "http://github.com/#{object.github_name}"
    end 
  end

  def member_since
  	created_at.strftime("%B %e, %Y")
  end
  ###

  
  ############################### 
  #Decorating Associated Objects
  ###############################
  decorates_association :articles

  def articles_title
  	articles.map(&:recent_articles)
  end

  def total_articles
  	articles.length
  end

  ###

  private

  def handle_none(value)
  	if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

  def check_gender
  	if object.gender == "male"
  		h.image_tag("1197115544208915882acspike_male_user_icon.svg.med.png", height: '50', width: '50') 
  	else
  		h.image_tag("girl_thumbnail.jpg", height: '50', width: '50') 
  	end
  end

end
