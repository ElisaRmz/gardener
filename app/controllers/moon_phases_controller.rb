require 'lunartic'

class MoonPhasesController < ApplicationController
  def go_back
    redirect_back(fallback_location: root_path)
  end

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

  def translate_phase(phase)
    translations = {
      new: 'Luna Nueva',
      waxing_crescent: 'Luna Creciente',
      first_quarter: 'Primer Cuarto Creciente',
      waxing_gibbous: 'Luna Gibosa Creciente',
      full: 'Luna Llena',
      waning_crescent: 'Luna Menguante',
      last_quarter: 'Último Cuarto Menguante',
      waning_gibbous: 'Luna Gibosa Menguante',
    }
      
    translations[phase]
  end
end
