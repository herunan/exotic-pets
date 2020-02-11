class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_pet, only: %i[new create]
  skip_before_action :authenticate_user!, only: %i[new]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pet = @pet
    authorize @booking
    if @booking.save
      flash[:alert] = "Borrowing requested"
      redirect_to pet_bookings_path(@pet, @booking)
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to edit_pet_booking_path(@booking)
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
    params.require(:booking).permit(:user_id, :pet_id, :start_date, :end_date, :confirmed)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
