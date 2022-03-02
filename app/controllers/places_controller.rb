class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place)
  end
end

private

def place_params
  params.require(:place).permit(:title, :address, :website, :description, :photo, :email)
end
