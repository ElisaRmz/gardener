class PlantCare < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :month, presence: false
  validates :moon, presence: true

  belongs_to :plant
end
