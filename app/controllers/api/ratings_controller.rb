class Api::RatingsController < ApplicationController
  def index
    render json: Rating.all, status: 200
  end

  def create
    text_item = TextItem.find(params[:text_item_id])
    rater = User.find(params[:rater_id])
    if text_item.present? && rater.present? 
      rating = Rating.create(:rating => params[:rating], :rater => rater, :text_item => text_item)
      if rating.valid?
        render json: rating, status: 201
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
    render json: Rating.update(:rating => params[:rating]), status: 200
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
