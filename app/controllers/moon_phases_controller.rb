require 'lunartic'

class MoonPhasesController < ApplicationController
    def index
        moon = Lunartic.today
        @phase = moon.phase
        @date = moon.day
    end
end

# Lunartic.on_date(10.days.from_now.to_date).phase