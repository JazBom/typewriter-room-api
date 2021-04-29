class Api::UsersController < ApplicationController
  skip_before_action :user_valid, :only [:create]

  def index
    render json: User.all, status: 200
  end

  def create
    puts user_params
    user = User.create(user_params)
    if user.valid?
      render json: user, status: 201
    else
      puts user.errors.inspect
      render json: { message: 'Unable to create user.' }, status: 500
    end
  end

  def show
    puts params[:id]
    render json: User.find(params[:id]), status: 200
  end

  def update
    puts params[:id]
    render json: User.find(params[:id]).update(user_params), status: 200
  end

  def destroy
    puts params[:id]
    User.destroy(params[:id])
    render json: { message: 'Successfully deleted user.' }, status: 200
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
