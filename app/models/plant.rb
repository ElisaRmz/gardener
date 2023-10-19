class Plant < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :family, presence: true, length: { maximum: 30 }
  validates :root_diameter, presence: true
  validates :maximum_temperature, presence: true
  validates :minimum_temperature, presence: true
  validates :germination_temperature, presence: true

  has_many :crops, class_name: 'Crop', dependent: :destroy
  #tiene muchos Lands
end
