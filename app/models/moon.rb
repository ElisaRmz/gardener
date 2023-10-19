class Moon
  attr_accessor :phase, :day

  def initialize(phase, day)
    @phase = phase
    @day = day
  end

  private

  def today_moon
    moon_today = Lunartic.today
    phase_today = moon_today.phase   # key
    @translated_phase_today = translate_phase(phase_today)
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
      waning_gibbous: 'Luna Gibosa Menguante'
    }
    translations[phase]
  end
end
