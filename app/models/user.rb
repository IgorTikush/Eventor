class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  has_many :participations, foreign_key: "attendee_id"
  has_many :creatored_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attended_events, through: :participations
end
