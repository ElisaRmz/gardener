class Plant::Biology < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :family, presence: true, length: { maximum: 30 }
  validates :light, presence: true
  validates :humidity, presence: true
  validates :root_depth, presence: true
  validates :root_diameter, presence: true
  validates :maximum_temperature, presence: true
  validates :minimum_temperature, presence: true
  validates :germination_temperature, presence: true

  # has_many :plant_crops, dependent: :destroy
end
