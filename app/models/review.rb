class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence:true
  validates :stars, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: true
end
