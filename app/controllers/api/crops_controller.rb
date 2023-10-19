class Api::CropsController < ApplicationController
  before_action :set_options, only: [:new, :create, :edit, :update]
  
  def new
    @form_method = :post
    @form_url = api_plant_crops_path
    @crop = Crop.new
  end

  def create
    @form_method = :post
    @form_url = api_plant_crops_path

    @plant = Plant.find(params[:plant_id])
    @crop = @plant.crops.build(crop_params)
    binding.pry
    if @crop.save
      redirect_to api_plant_path(@plant)
    else
      render :new, status: 422
    end
  end

  private

  def crop_params
    # añadir tabla con los meses, un cuidado tiene varios meses
    params.require(:crop).permit(:name, :moon)
  end

  def set_options
    @month_options = %w[Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre]
  end
end
