require 'rails_helper'

RSpec.describe User, typer: :model do
  let(:user_attributes) do
    {
      name: "Luis",
      password: 123
    }
  end

  it "has many lands" do
    user = User.create(user_attributes)

    land_1 = Land.create(name: "land_1", user: user)
    land_2 = Land.create(name: "land_2", user: user)

    expect(user.lands).to include(land_1, land_2)
  end

  it "has no lands" do
    user = User.create(user_attributes)

    expect(user.lands).to be_empty
  end
end