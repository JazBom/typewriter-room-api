class Api::TextItemsController < ApplicationController
  def index
    render json: TextItem.all, status: 200
  end

  def create
    text_item = TextItem.create(text_item_params)
    if text_item.valid?
      render json: text_item, status: 201
    else
      puts text_item.errors.inspect
      render json: { message: 'Unable to create text item.' }, status: 500
    end
  end

  def show
    puts params[:id]
    render json: TextItem.find(params[:id]), status: 200
  end

  def update
    puts params[:id]
    render json: TextItem.find(params[:id]).update(text_item_params), status: 200
  end

  def destroy
    puts params[:id]
    TextItem.destroy(params[:id])
    render json: { message: 'Text item successfully deleted.' }, status: 200
  end

  def text_item_params
    params.require(:text_item).permit(:text, :published, :writer_id, :inspiration_id)
  end
end
