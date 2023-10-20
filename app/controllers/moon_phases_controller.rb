class MoonPhasesController < ApplicationController
  def index
    moon = Moon.new
    @translated_phase_today = moon.translated_phase_today
    @moon_data = moon.cycle
  end
end
