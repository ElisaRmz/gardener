require 'lunartic'

class MoonPhasesController < ApplicationController
  def index
    moon_today = Lunartic.today
    phase_today = moon_today.phase   #key
    @translated_phase_today = translate_phase(phase_today)

    @moon_data = []
    current_date = Date.today

    29.times do |n|
      date = current_date + n
      moon = Lunartic.on_date(date)
      translated_phase = translate_phase(moon.phase)
      @moon_data << { date: date, phase: translated_phase, day: moon.day }
    end
  end
  
  private
  def go_back
    redirect_back(fallback_location: root_path)
  end
end
