class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  validates :price, presence:true
  # validates :description, presence:true
  validates :category, presence:true
  validates :name, presence:true
  # validates :availability, presence:true
  # validates :capacity, presence:true

  mount_uploader :photo, PhotoUploader
end
