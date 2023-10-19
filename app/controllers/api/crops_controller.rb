class Api::CropsController < ApplicationController
  before_action :set_options, only: [:new, :create, :edit, :update]
  
  def new
    @form_method = :post
    @form_url = api_crops_path
    @plant_crop = Plant::Crop.new
  end

  def create
    @form_method = :post
    @form_url = api_crops_path

    @plant_crop = Plant::Crop.new(plant_crop_params)

    if @plant_crop.save
      redirect_to api_crops_path
    else
      render :new, status: 422
    end
  end

  private

  def plant_crop_params
    params.require(:plant_crop).permit(:name, :month, :moon)
  end

  def set_options
    @month_options = %w[Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre]
  end
end
