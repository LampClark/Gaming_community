class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authorize_owner, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile_picture)
  end

  def authorize_owner
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
