class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    @pets = Pet.all
  end

  def show
    @booking = Booking.new # This enables new booking in the show page
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :address, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
