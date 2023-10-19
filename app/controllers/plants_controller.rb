class PlantsController < ApplicationController
  before_action :set_options, only: [:new, :create, :edit, :update]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @form_method = :post
    @form_url = api_plants_path

    @plant = Plant.new
  end

  def create
    @form_method = :post
    @form_url = api_plants_path

    @plant = Plant.new(plant_params)

    if @plant.save
      redirect_to api_plants_path
    else
      render :new, status: 422
    end
  end

  def edit
    @form_method = :patch
    @form_url = api_plant_path(params[:id])
    @plant = Plant.find(params[:id])
  end

  def update
    @form_method = :patch
    @form_url = api_plant_path(params[:id])
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      redirect_to api_plants_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    flash[:notice] = "Planta eliminada con éxito."

    redirect_to api_plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :family, :light, :humidity, :root_depth, :root_diameter, :maximum_temperature, :minimum_temperature, :germination_temperature)
  end

  def set_options
    @light_options = ["-", "Sombra", "Media sombra", "Sol"]
    @humidity_options = ["-", "Baja", "Media", "Alta"]
    @root_options = ["-", "Superficial", "Profunda", "Moderada"]
  end
end
