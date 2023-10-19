require 'rails_helper'
require 'lunartic'

RSpec.describe Moon, type: :operator do
  it "returns the correct moon" do
    date = Date.new(2023, 9, 30)
    moon = Lunartic.on_date(date)
      
    expect(moon.phase).to eq(:full)
  end
end