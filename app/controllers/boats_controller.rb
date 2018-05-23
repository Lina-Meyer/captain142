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

    @boats_with_location = Boat.where.not(latitude: nil, longitude: nil)
    @boats_without_location = Boat.where(latitude: nil, longitude: nil)
    # Should be deleted
    @all_boats = @boats_with_location.to_a.concat(@boats_without_location.to_a)
    # @boats = policy_scope(Boat).order(created_at: :desc)

    # @boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
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
    params.require(:boat).permit(:name, :price, :description, :city, :category, :capacity, :photo)
  end
end

