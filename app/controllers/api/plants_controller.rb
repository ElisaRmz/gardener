class Api::PlantsController < ApplicationController
  before_action :set_options, only: [:new, :create, :edit, :update]

  def index
    @plants = Plant::Biology.all
  end

  def show
    @plant_biology = Plant::Biology.find(params[:id])
  end

  def new
    @form_method = :post
    @form_url = api_plants_path

    @plant_biology = Plant::Biology.new
  end

  def create
    @form_method = :post
    @form_url = api_plants_path

    @plant_biology = Plant::Biology.new(plant_biology_params)

    if @plant_biology.save
      redirect_to api_plants_path
    else
      render :new, status: 422
    end
  end

  def edit
    @form_method = :patch
    @form_url = api_plant_path(params[:id])
    @plant_biology = Plant::Biology.find(params[:id])
  end

  def update
    @form_method = :patch
    @form_url = api_plant_path(params[:id])
    @plant_biology = Plant::Biology.find(params[:id]

    if @plant_biology.update(plant_biology_params)
      redirect_to api_plants_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    @plant = Plant::Biology.find(params[:id])
    @plant.destroy

    flash[:notice] = "Planta eliminada exitosamente."

    redirect_to api_plants_path
  end

  private

  def plant_biology_params
    params.require(:plant_biology).permit(:name, :family, :light, :humidity, :root_depth, :root_diameter, :maximum_temperature, :minimum_temperature, :germination_temperature)
  end

  def set_options
    @light_options = ["-", "Sombra", "Media sombra", "Sol"]
    @humidity_options = ["-", "Baja", "Media", "Alta"]
    @root_options = ["-", "Superficial", "Profunda", "Moderada"]
  end
end
