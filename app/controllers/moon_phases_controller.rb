class MoonPhasesController < ApplicationController
  def index
    moon = Moon.new
    @translated_phase_today = moon.translated_phase_today
    @moon_data = moon.cycle
  end

  private

  def go_back
    redirect_back(fallback_location: root_path)
  end
end
