class LandsController < ApplicationController
  before_action :authenticate_user!

  def new
    @land = Land.new
  end

  def create
    @land = Land.new(land_params)
    if @land.save
      redirect_to @land, notice: 'La tierra ha sido creada exitosamente.'
    else
      render 'new'
    end
  end

  private

  def land_params
    params.require(:land).permit(:nombre)
  end
end