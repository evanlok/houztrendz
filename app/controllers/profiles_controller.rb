class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:me, :update]

  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    render template: 'profiles/show'
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_profile_url, notice: 'Profile updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :phone, :email, :biography, :avatar, :broker_logo)
  end
end
