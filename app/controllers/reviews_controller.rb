class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.pet = @booking.pet
    @review.user = current_user
    @review.booking = @booking
    authorize @review
    if @review.save!
      redirect_to booking_path(@booking)
    else
      render 'bookings/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :pet_id)
  end
end
