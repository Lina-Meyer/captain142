class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  has_many :reviews

  validates :start_date, presence:true
  validates :end_date, presence:true

  # validates_uniqueness_of :user_id, :scope => [:boat_id]

end
