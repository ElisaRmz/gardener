class Plant::Biology < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :family, presence: true, length: { maximum: 30 }
  validates :root_diameter, presence: true
  validates :maximum_temperature, presence: true
  validates :minimum_temperature, presence: true
  validates :germination_temperature, presence: true

  has_many :plant_crops, class_name: 'Plant::Crop', dependent: :destroy
end
