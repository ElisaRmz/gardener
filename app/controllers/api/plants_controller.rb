class Api::PlantsController < ApplicationController
  def index
    @plants = Api::PlantsController::PlantBiology.all
  end

  def show
    @plant = PlantBiology.find(params[:id])
  end

  def new
    @plant = PlantBiology.new
  end

  def create
    @plant = PlantBiology.new(plant_biology_params)

    if @plant.save
      redirect_to @plant
    else
      render :new
    end
  end

  def edit
    @plant = PlantBiology.find(params[:id])
  end

  def update
    @plant = PlantBiology.find(params[:id])

    if @plant.update(plant_biology_params)
      redirect_to @plant
    else
      render :edit
    end
  end

  def destroy
    @plant = PlantBiology.find(params[:id])
    @plant.destroy

    redirect_to @plants_path
  end

  private

  def plant_biology_params
    params.require(:PlantBiology).permit(:name, :family)
  end
end 