class Moon
  def initialize
    @moon = Lunartic.today
  end

  def cycle
    Array.new(29) do |n|
      date = @moon.date + n
      moon = Lunartic.on_date(date)
      translated_phase = translate_phase(moon.phase)
      { date: date, phase: translated_phase, day: moon.day }
    end
  end

  def translated_phase_today
    translate_phase(@moon.phase)
  end

  private

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
