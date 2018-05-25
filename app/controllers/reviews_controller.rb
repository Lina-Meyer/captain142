class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end
  def create
    @review = Review.new(review_params)
    authorize @review
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end



  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
