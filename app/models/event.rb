class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  #testing
  has_many :attendees, class_name: "User"
end
