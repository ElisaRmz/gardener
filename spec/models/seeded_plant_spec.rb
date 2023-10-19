require 'rails_helper'

RSpec.describe SeededPlant, type: :model do

  it "has many seeded plant care tasks" do
    land = Land.create(name: "Humedal")
    plant = Plant.create(name: "Fresa")
    seeded_plant = SeededPlant.create(description: "descripción 1", land: land, plant: plant)

    seeded_plant_care_task_1 = SeededPlantCareTask.create(done: Time.now, seeded_plant: seeded_plant)
    seeded_plant_care_task_2 = SeededPlantCareTask.create(done: Time.now, seeded_plant: seeded_plant)

    expect(seeded_plant.seeded_plant_care_tasks).to include(seeded_plant_care_task_1, seeded_plant_care_task_2)
  end

  it "has no seeded plant care tasks" do
    land = Land.create(name: "Humedal")
    plant = Plant.create(name: "Fresa")
    seeded_plant = SeededPlant.create(description: "descripción 1", land: land, plant: plant)

    expect(seeded_plant.seeded_plant_care_tasks).to be_empty
  end

  it "belongs to one plant" do
    plant = Plant.create(name: "Fresa")
    seeded_plant = SeededPlant.create(description: "description 1", plant: plant)

    expect(seeded_plant.plant.name).to include("Fresa")
  end

  it "belongs to one land" do
    land = Land.create(name: "Humedal")
    seeded_plant = SeededPlant.create(description: "description 1", land: land)

    expect(seeded_plant.land.name).to include("Humedal")
  end
end