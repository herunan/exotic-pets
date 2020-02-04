class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :pet_id, :start_date, :end_date, :confirmed, :review, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
