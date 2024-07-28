class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,:first_name, :last_name, :first_name_read, :last_name_read)
  end
end
