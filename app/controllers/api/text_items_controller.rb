class Api::TextItemsController < ApplicationController
  def index
    if 
      # check if query parameter coming in, otherwise get all
      render json: TextItem.where(...), status: 200
    else
      render json: TextItem.all, status: 200
    end
    # published = params[:published]
    # user_id = params[:user_id]
    # render json: TextItem.where(:published => published, :writer_id => user_id), status: 200
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
    text_item = TextItem.include(:ratings, :writer, :inspiration).find(params[:id])
    if text_item.present?
      render json: text_item, status: 200
    else
      render json: { message: 'Unable to display, text item does not exist.' }, status: 404
    end
  end

  def update
    puts params[:id]
    text_item = TextItem.find(params[:id])
    if text_item.present?
      updated_text_item = text_item.update(text_item_params)
      render json: updated_text_item, status: 200
    else
      render json: { message: 'Cannot find text item to update.' }, status: 404
    end
    # alternative
    # writer = User.find(params[:writer_id])
    # inspo = Inspiration.find(params[:inspiration_id])
    # if (writer != nil && inspo != nil) 
    #   text_item_to_update = TextItem.find(params[:id])
    #   text_item_to_update.update(:text => params[:text], :published => params[:published], :writer => writer, :inspiration => inspo])
    # end
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
