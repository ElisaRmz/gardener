require 'rails_helper'

RSpec.describe plant_list, type: :model do

  let(:plant_list_attributes) do
    { 
      name: "fresa",
      family: "rosacea",
      root_diameter: 2,
      maximum_temperature: 20,
      minimum_temperature: 0,
      germination_temperature: 10
    }
  end
  
  it "creates a plant_list" do
    plant_list = described_class.create(plant_list_attributes)

    expect(plant_list.persisted?).to eq true
  end

  it "fails to create a plant_list with missing params" do
    plant_list = described_class.create

    expect(plant_list.errors.attribute_names).to match_array(plant_list_attributes.keys)
  end

  it "fails to create a plant_list with a long family name" do
    plant_list_attributes[:family] = "a" * 31

    plant_list = described_class.create(plant_list_attributes)

    expect(plant_list.errors.attribute_names).to match_array([:family])
  end
end
