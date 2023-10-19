class Plant::Crop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  months = %w[- enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre].freeze
  validates :month, presence: true, inclusion: { in: months, message: "%{value} is not valid" }

  validates :moon, presence: true, inclusion: { in: %w[nueva llena menguante creciente], message: "%{value} is not valid" }

  belongs_to :plant_biology, class_name: 'Plant::Biology'
end
