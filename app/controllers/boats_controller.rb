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
    if params[:query].present?
      @boats = Boat.where("city ILIKE ?", "%#{params[:query]}%")
    else
      @boats = Boat.all
    end

    skip_policy_scope

    @markers = @boats.map do |boat|
       {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
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
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def update

    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.update(boat_params)
    redirect_to own_boats_path
  end

  def destroy
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.destroy
    redirect_to own_boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :description, :city, :category, :capacity, :photo)
  end
end

