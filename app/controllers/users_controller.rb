class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :first_name_read, :last_name_read)
  end
end
