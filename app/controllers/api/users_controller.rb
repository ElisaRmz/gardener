class Api::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    #@form_method = :post
    #@form_url = api_users_path

    @user = User.new
  end

  def create
    #@form_method = :post
    #@form_url = api_users_path

    @user = User.new(user_params)

    if @user.save
      redirect_to api_users_path
    else
      render :new, status: 422
    end 
  end

  def edit
    #@form_method = :patch
    #@form_url = api_user_path(params[:id])
    @user = User.find(params[:id])
  end

  def update
    #@form_method = :patch
    #@form_url = api_user_path(params[:id])
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to api_users_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "Usuario eliminado con éxito."

    redirect_to api_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end