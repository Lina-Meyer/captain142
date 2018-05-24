class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :index, :show]


  def dashboard
    @boats = policy_scope(Boat).order(created_at: :desc)
    @boat = current_user.owned_boats
    @boat_requested = current_user.owned_boats.where(status: "pending")

    @bookings = policy_scope(Booking).order(created_at: :desc)
    @booking = current_user.bookings
    boats_id = current_user.owned_boats.pluck(:id)
    @booking_status = Booking.where(boat_id: boats_id)
    @bookings_all = Booking.where(boat_id: boats_id)
    authorize @boat

  end

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

    @boats_with_location = Boat.where.not(latitude: nil, longitude: nil)
    @all_boats = policy_scope(Boat).order(created_at: :desc)

    @markers = @boats_with_location.map do |boat|
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

