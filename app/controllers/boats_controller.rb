class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  def home
    @boats = Boat.all
  end

  def index
    @boats_with_location = Boat.where.not(latitude: nil, longitude: nil)
    @boats_without_location = Boat.where(latitude: nil, longitude: nil)
    @all_boats = @boats_with_location.to_a.concat(@boats_without_location.to_a)

    @markers = @boats_with_location.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude#,
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :description, :category, :capacity, :photo)
  end
end
