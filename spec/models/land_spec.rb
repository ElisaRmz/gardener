require 'rails_helper'

RSpec.describe Land, type: :model do
  let(:land_attributes) do
    { name: "Humedal" }
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

  it "has many seeded_plants" do
    user = User.create(user_attributes)
    land = Land.create(name: "Humedal", user: user)

    plant = Plant.create(plant_attributes)
    seeded_plant_1 = SeededPlant.create(description: "description 1", land: land, plant:plant)
    seeded_plant_2 = SeededPlant.create(description: "description 2", land: land, plant:plant)

    expect(land.seeded_plants).to include(seeded_plant_1, seeded_plant_2)
  end

  it "has no seeded_plants" do
    land = Land.create(land_attributes)

    expect(land.seeded_plants).to be_empty
  end

  it "belongs to one user" do
    user = User.create(user_attributes)
    land = Land.create(name: "Humedal", user: user)

    expect(land.user).to include(name: "Luis")
  end
end