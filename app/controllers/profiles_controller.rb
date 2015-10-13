class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:me, :update]

  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    render template: 'profiles/show'
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to current_profile_url, notice: 'Profile updated.'
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :phone, :email, :biography)
  end
end
