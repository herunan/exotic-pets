class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
<<<<<<< HEAD
=======

  def show
  end
>>>>>>> 5ca20b0be511751d6be17292d7ba4c52e8ea1f79

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :photo)
  end
end
