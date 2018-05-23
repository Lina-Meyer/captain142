class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @boats = Boat.all
    authorize @boats
  end

  def own_boats
    @boats = policy_scope(Boat).order(created_at: :desc)
    @boat = current_user.owned_boats
    authorize @boat
  end

  def index
    @boats_with_location = Boat.where.not(latitude: nil, longitude: nil)
    @all_boats = policy_scope(Boat).order(created_at: :desc)

    @markers = @boats_with_location.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude#,
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    authorize @boat
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

