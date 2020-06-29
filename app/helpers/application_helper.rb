# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user, size = 80)
    if user.avatar.attached?
      user.avatar.variant(resize_to_limit: [size, size])
    else
      gravatar_image_url(user.email, size: size)
    end
  end
  
  def event_cover_image(event, size = 700)
    if event.cover_image.attached?
      event.cover_image.variant(resize_to_limit: [size, size])
    else
      ActionController::Base.helpers.image_url('placeholder.jpg', size: size)
    end
  end
end
