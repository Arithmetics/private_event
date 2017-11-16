class User < ApplicationRecord
  has_many :hosted_events, class_name: "Event", dependent: :destroy, foreign_key: "creator_id"
  has_many :rsvps, foreign_key: "attendee_id"
  has_many :attended_events, :through => :rsvps

end
