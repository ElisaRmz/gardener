class Plant::Crop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  validates :month, presence: false

  validates :moon, presence: true

  belongs_to :plant_biology, class_name: 'Plant::Biology'
end
