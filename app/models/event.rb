class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one_attached :cover_image
end
