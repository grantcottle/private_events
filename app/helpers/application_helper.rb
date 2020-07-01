# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user, size = 80)
    if user.avatar.attached?
      user.avatar.variant(resize_to_limit: [size, size])
    else
      gravatar_image_url(user.email, size: size)
    end
  end
  
  def event_cover_image(event, width=600 ,height = 300)
    if event.cover_image.attached?
      event.cover_image.variant(resize_to_limit: [width, height])
    else
      ActionController::Base.helpers.image_url('placeholder.jpg', width: width, height: height)
    end
  end
end
