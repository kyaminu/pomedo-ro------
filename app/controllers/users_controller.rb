class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: "ユーザーを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end