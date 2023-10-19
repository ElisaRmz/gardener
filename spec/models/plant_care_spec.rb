require 'rails_helper'

RSpec.describe PlantCare, type: :model do
    let(:plant_attributes) do
      {
        name: "fresa",
        family: "rosacea",
        root_diameter: 2,
        maximum_temperature: 20,
        minimum_temperature: 0,
        germination_temperature: 10
      }
    end

    it "belongs to one plant" do
        plant = Plant.create(plant_attributes)
        plant_care = PlantCare.create(name: "sembrar", moon: "llena", plant: plant)

        expect(plant_care.plant.name).to include("fresa")
    end
end