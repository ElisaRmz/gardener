require 'rails_helper'

RSpec.describe Plant, type: :model do
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

  let(:land_attributes) do 
    { name: "Humedal" }
  end

  it "has many seeded_plants" do
    plant = Plant.create(plant_attributes)
    land = Land.create(land_attributes)

    seeded_plant_1 = SeededPlant.create(description: "description 1", plant: plant, land: land)
    seeded_plant_2 = SeededPlant.create(description: "description 2", plant: plant, land: land)

    expect(plant.seeded_plants).to include(seeded_plant_1, seeded_plant_2)
  end

  it "has no seeded_plants" do
    plant = Plant.create(plant_attributes)

    expect(plant.seeded_plants).to be_empty
  end
  
  it "has many plant_care" do
    plant = Plant.create(plant_attributes)

    plant_care_1 = PlantCare.create(name: "care_1", moon: "creciente", plant: plant)
    plant_care_2 = PlantCare.create(name: "care_2", moon: "menguante", plant: plant)

    expect(plant.plant_cares).to include(plant_care_1, plant_care_2)
  end

  it "has no plant_care" do
    plant = Plant.create(plant_attributes)

    expect(plant.plant_cares).to be_empty
  end

  it "when is destroyed, plant_care is destroyed too" do
    plant = Plant.create(plant_attributes)

    plant_care_1 = PlantCare.create(name: "care_1", moon: "creciente", plant: plant)
    plant_care_2 = PlantCare.create(name: "care_2", moon: "menguante", plant: plant)

    plant.destroy

    expect(Plant.where(id: [plant_care_1.id, plant_care_2.id])).to be_empty
 
  end
end
