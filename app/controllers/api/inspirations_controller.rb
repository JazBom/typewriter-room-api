class Api::InspirationsController < ApplicationController
  def index
    render json: Inspiration.all, status: 200
  end

  def create
    existing_inspo_item = Inspiration.find_by(sentenceOf: inspiration_params[:sentenceOf], sentence: inspiration_params[:sentence], imageUrl: inspiration_params[:imageUrl], imageOf: inspiration_params[:imageOf])
    unless existing_inspo_item.present? 
      inspiration = Inspiration.create(inspiration_params)
      if inspiration.valid?
        render json: inspiration, status: 201
      else
        # puts inspiration.errors.inspect
        render json: { message: 'Unable to create inspiration record.' }, status: 500
      end
    else
      render json: existing_inspo_item, status: 201
    end
  end

  def show
    render json: Inspiration.find(params[:id]), status: 200
  end

  def update
    render json: Inspiration.find(params[:id]).update(inspiration_params), status: 200
  end

  def destroy
    Inspiration.destroy(params[:id])
    render json: { message: 'Successfully deleted inspiration record.' }, status: 200
  end

  def inspiration_params
    params.require(:inspiration).permit(:sentence, :sentenceOf, :imageUrl, :imageOf)
  end
end
