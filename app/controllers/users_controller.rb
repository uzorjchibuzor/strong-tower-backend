class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @user }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {status: 401} }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path }
        format.json { render json: @user }
      else
        format.html { redirect_to root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end
end
