class Api::PlantsController < ApplicationController
  def index
    @plants = Plant::Biology.all
  end

  def show
    @plant = Plant::Biology.find(params[:id])
  end

  def new
    @light_options = ["-", "Sombra", "Media sombra", "Sol"]
    @humidity_options = ["-", "Baja", "Media", "Alta"]
    @root_options = ["-", "Superficial", "Profunda", "Moderada"]
    @plant = Plant::Biology.new
  end

  def create
    @plant = Plant::Biology.new(plant_biology_params)

    if @plant.save
      redirect_to api_plants_path
    else
      flash[:alert] = "No se pudo guardar la planta debido a errores de validación"
      render :new
    end
  end

  def edit
    @plant = Plant::Biology.find(params[:id])
  end

  def update
    @plant = Plant::Biology.find(params[:id])

    if @plant.update(plant_biology_params)
      redirect_to @plant
    else
      render :edit
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
end
