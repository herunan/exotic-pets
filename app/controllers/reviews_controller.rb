class ReviewsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_review, only: %i[show edit update]
  before_action :set_booking

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to review_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
>>>>>>> 945b1093fd774c18bdca0d434859964eb5569c00
end
