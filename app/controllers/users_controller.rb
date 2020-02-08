class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_user, only: %i[show]

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number, :photo)
  end
end
