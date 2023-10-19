class SeededPlant < ApplicationRecord
    belongs_to :land
    belongs_to :plant
    has_many :seeded_plant_care_tasks, dependent: :destroy
end