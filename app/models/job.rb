class Job < ApplicationRecord

  belongs_to :company
  has_many :applies

  validates :name, presence: true
  validates :place, presence: true

end
