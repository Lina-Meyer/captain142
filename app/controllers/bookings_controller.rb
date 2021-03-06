class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @boat = @booking.boat
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
    redirect_to booking_path(@booking)
  end

  def accept
    booking = Booking.find(params[:id])
    booking.status = 'accepted'
    authorize booking
    booking.save
    redirect_back(fallback_location: dashboard_path)
  end

  def decline
    booking = Booking.find(params[:id])
    booking.status = 'declined'
    authorize booking
    booking.save
    redirect_back(fallback_location: dashboard_path)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    dates = params.require(:booking).permit(:start_date, :end_date, :status)
    return {
      start_date: Date.strptime(dates[:start_date], '%m/%d/%Y').to_date,
      end_date: Date.strptime(dates[:end_date], '%m/%d/%Y').to_date
    }
  end
end
