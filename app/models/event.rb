class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendess, through: :invitations, source: :attendee
  has_one_attached :cover_image, dependent: :destroy
  scope :past_events, -> {where("date < ?", Date.today).order("date DESC")}
  scope :live_events, -> {where("date >= ?", Date.today).order("date ASC")}
end
