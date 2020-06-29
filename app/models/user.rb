class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :events, foreign_key: 'creator_id'
  has_many :invitations, foreign_key: 'attendee_id'
  has_many :attended_events, through: :invitations

  def past_events
    self.attended_events.past_events
  end

  def live_events
    self.attended_events.live_events
  end

end
