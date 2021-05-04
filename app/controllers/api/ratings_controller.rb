class Api::RatingsController < ApplicationController
  def index
    render json: Rating.all, status: 200
  end

  def create
    text_item = TextItem.find(rating_params[:text_item_id])
    rater = User.find(rating_params[:rater_id])
    if text_item.present? && rater.present? 
      rating = Rating.create(:rating => rating_params[:rating], :rater => rater, :text_item => text_item)
      avg_rating = Rating.where(text_item: text_item).average(:rating)
      if rating.valid?
        render json: avg_rating, status: 201
      else
        puts rating.errors.inspect
        render json: { message: 'Unable to create rating' }, status: 500
      end
    else
      render json: { message: 'Cannot find text item to rate' }, status: 401
    end
  end

  def update
    puts params[:id]
    render json: Rating.update(:rating => rating_params[:rating]), status: 200
  end

  def destroy
    puts rating_params[:id]
    Rating.destroy(rating_params[:id])
    render json: { message: 'Rating successfully destroyed.' }, status: 200
  end

  def rating_params
    params.require(:rating).permit(:text_item_id, :rater_id, :rating)
  end
end
