class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one_attached :cover_image
  scope :past_events, -> {where("date < ?", Date.today)}
  scope :live_events, -> {where("date >= ?", Date.today)}
end
