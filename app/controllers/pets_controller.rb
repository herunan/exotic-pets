class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    @pets = policy_scope(Pet)
  end

  def show
    @review = Review.new
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
      redirect_to pet_path(@petet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :address, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end
end
