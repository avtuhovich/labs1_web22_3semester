class Geek < ApplicationRecord

  has_many :applies

  validates :name, presence: true
  validates :stack, presence: true
  validates :resume, length: {minimum: 0, maximum: 10000}

end
