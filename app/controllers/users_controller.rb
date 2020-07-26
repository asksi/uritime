class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
    # groups/newのアクション
    @group = Group.new
    @group.users << current_user
    
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録が完了しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to @user
    else
      flash[:danger] = "プロフィールを更新できませんでした。"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    
    flash[:success] = "ユーザを削除しました。"
    redirect_to users_url
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :profile)
  end
end
