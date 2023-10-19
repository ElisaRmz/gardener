class MainPagesController < ApplicationController
  def index
    moon = Moon.new
    @translated_phase_today = moon.translated_phase_today
  end
end
