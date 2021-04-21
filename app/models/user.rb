class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :creatored_events, foreign_key: "creator_id", class_name: "Event"
end
