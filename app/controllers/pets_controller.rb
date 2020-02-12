class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      sql_query = "species @@ :query OR address @@ :query"
      @pets = policy_scope(Pet).where(sql_query, query: "%#{params[:query]}%")
    else
      @pets = policy_scope(Pet)
    end
  end

  def show
    @booking = Booking.new # This enables new booking in the show page
    @pet_location = Pet.geocoded #returns pet with coordinates

    @markers = @pet_location.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet }),
        image_url: helpers.asset_url('mark.png')
      }
    end
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
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
    params.require(:pet).permit(:name, :species, :description, :address, :price, photos: [])
  end

  def set_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end
end
