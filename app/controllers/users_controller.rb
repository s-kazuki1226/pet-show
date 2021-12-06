class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end

  def show
    @user = User.find(params[:id])
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
    #byebug
    if @user.update(user_params)
      flash[:success] = 'プロフィールを編集しました。'
      render :edit
    else
      flash.now[:danger] = 'プロフィールの編集に失敗しました。'
      render :edit
    end   
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image )
  end
end
