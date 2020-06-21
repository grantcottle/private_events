# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user, size = 80)
    if user.avatar.attached?
      user.avatar.variant(resize_to_limit: [size, size])
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end
