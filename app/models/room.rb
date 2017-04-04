class Room < ApplicationRecord
  belongs_to :user
  #  Validations are used to ensure that only valid data is saved into your database
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summar, presence: true
  validates :address, presence: true
end
