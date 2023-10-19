require 'rails_helper'

RSpec.describe SeededPlantCareTask, type: :model do
  let(:seeded_plant_attributes) do
    { description: "descripción 1" }
  end

  let(:user_attributes) do
    {
      name: "Luis",
      password: 123
    }
  end

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

  it "belongs to one seeded plant" do
    user = User.create(user_attributes)
    land = Land.create(name: "Humedal", user: user)
    plant = Plant.create(plant_attributes)

    seeded_plant = SeededPlant.create(description: "descripción 1", land: land, plant: plant)
    seeded_plant_care_task = SeededPlantCareTask.create(done: Time.now, seeded_plant: seeded_plant)
    
    expect(seeded_plant_care_task.seeded_plant.description).to include("descripción 1")
  end
end