class Api::InspirationsController < ApplicationController
  
  # What happens when it's not a 200? 
  def index
    render json: Inspiration.all, status: 200
  end

  def create
    puts inspiration_params
    inspiration = Inspiration.create(inspiration_params)
    if inspiration.valid?
      render json: inspiration, status: 201
    else
      puts inspiration.errors.inspect
      render json: { message: 'Unable to create inspiration record.' }, status: 500
    end
  end

  # What happens when the id isn't found? Sad paths aren't explicitly covered like in your create function
  def show
    puts params[:id]
    render json: Inspiration.find(params[:id]), status: 200
  end

  # Same goes here - If something's not found or can't be updated, then what happens?
  def update
    puts params[:id]
    render json: Inspiration.find(params[:id]).update(inspiration_params), status: 200
  end

  # Same for this one - what happens when it's not a 200? 
  def destroy
    puts params[:id]
    Inspiration.destroy(params[:id])
    render json: { message: 'Successfully deleted inspiration record.' }, status: 200
  end

  def inspiration_params
    params.require(:inspiration).permit(:sentence, :sentenceOf, :imageUrl, :imageOf)
  end
end
