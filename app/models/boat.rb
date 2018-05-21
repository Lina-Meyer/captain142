class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :price, presence:true
  validates :description, presence:true
  validates :category, presence:true
  validates :name, presence:true
  validates :availability, presence:true
  validates :capacity, presence:true
end
