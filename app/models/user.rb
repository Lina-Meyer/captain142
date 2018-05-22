class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :owned_boats, class_name: 'Boat'
  has_many :bookings
  has_many :rented_boats, through: :bookings, source: 'boat'

  validates :email, presence: true

  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
