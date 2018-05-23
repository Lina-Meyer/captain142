class BookingsController < ApplicationController
  def show
    @boat = Boat.find(params[:boat_id])
    authorize @boat
    @booking = Booking.find(params[:id])
    authorize @booking
  end
  def create
    # initialize new booking with start and end date
    @booking = Booking.new(booking_params)
    # assign boat to booking
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    # assign current user to booking
    @booking.user = current_user
    @booking.save

    authorize @booking
    redirect_to boat_booking_path(@boat, @booking)
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
