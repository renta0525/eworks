class UsersController < ApplicationController
  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :first_name_read, :last_name_read)
  end
end
