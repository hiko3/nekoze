class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @user_follows = @user.followings
    @user_followers = @user.followers
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path(@user)
    else
      flash[:alert] = "編集に失敗しました"
      redirect_to user_path(@user)
    end
  end

  def destroy

  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @user_follows = @user.followings
    @user_followers = @user.followers
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end


private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end