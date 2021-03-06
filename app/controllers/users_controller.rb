class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :likes]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.where.not(id: current_user.id).order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc)
    counts(@user)
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'アカウントを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'アカウントの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールを編集しました。'
      redirect_to @user
    else
    # byebug

      flash.now[:danger] = 'プロフィールの編集に失敗しました。'
      render :edit
    end   
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes
    counts(@user)
  end  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image )
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
