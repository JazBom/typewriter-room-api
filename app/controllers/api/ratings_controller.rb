class Api::RatingsController < ApplicationController
  def index
    render json: Rating.all, status: 200
  end

  def create
    rating = Rating.create(rating_params)
    if rating.valid?
      render json: rating, status: 201
    else
      puts rating.errors.inspect
      render json: { message: 'Unable to create rating' }, status: 500
    end
  end

  def show
    puts params[:id]
    render json: Rating.find(params[:id]), status: 200
  end

  def update
    puts params[:id]
    render json: Rating.find(params[:id]).update(rating_params), status: 200
  end

  def destroy
    puts params[:id]
    Rating.destroy(params[:id])
    render json: { message: 'Rating successfully destroyed.' }, status: 200
  end

  def rating_params
    params.require(:rating).permit(:text_item_id, :rater_id, :rating)
  end
end
