class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.valid?
      @user.save
      redirect_to users_path
    else
      redirect_to new_users_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    respond_to? do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path(current_user), notice: 'User was successfully updated.' }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
