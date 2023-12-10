class UserRolesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @users = User.all
  end

  def update
    @user = User.find_by(id: params[:user][:user_id])
    if @user.update(user_params)
      @user.update!(role: params[:user][:role])
      redirect_to root_path, notice: 'Role actualizado exitosamente.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:role, :name, :surname)
  end
end
