class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
  end

  # def edit
  # end

  # def update
  #   @user.update(user_params)
  #   redirect_to user_path(@user)
  # end

  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  # end

  def set_user
    @user = User.find(params[:id])
  end
end
