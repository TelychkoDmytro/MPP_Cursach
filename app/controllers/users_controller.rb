class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_blocked, only: [:show, :edit, :update]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :bio) # Add other fields you want to permit
  end

  def check_blocked
    if @user.blocked?
      redirect_to root_path, alert: t('user.blocked')
    end
  end
end
