class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  def home
  end

  def index
    @boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @boats.map do |boat|
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
