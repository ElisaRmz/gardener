class PlantBiology < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :family, presence: true, length: { maximum: 30 }
  validates :light, presence: true, inclusion: { in: %w[bajo medio alto], message: "%{value} is not valid" }
  validates :humidity, presence: true, inclusion: { in: %w[bajo medio alto], message: "%{value} is not valid" }
  validates :root_diameter, presence: true, numericality: { only_integer: true }
  validates :root_depth, presence: true, inclusion: { in: %w[superficial profunda moderada], message: "%{value} is not valid" }
  validates :maximum_temperature, presence: true, numericality: { only_integer: true }
  validates :minimun_temperature, presence: true, numericality: { only_integer: true }
  validates :germation_temperature, presence: true, numericality: { only_integer: true }

  has_many :plant_crops, dependent: :destroy
end
