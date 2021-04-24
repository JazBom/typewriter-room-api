class Api::TextItemsController < ApplicationController
  def index
    all_text_items = TextItem.includes(:ratings, :writer, :inspiration).all
    render json: all_text_items, include: [:ratings, :writer, :inspiration], status: 200
    # create a route for published text items only
    # published = params[:published] - where boolean = true
    # render json: TextItem.where(published: published), status: 200

    # create route for the MyPages, for text items only written by the user loggedin
    # user_id = params[:user_id] #some way of checking this through who is loggedin
    # render json: TextItem.where(writer_id: user_id), status: 200
  end

  def create
    writer = User.find(params[:writer_id])
    inspiration = Inspiration.find(params[:inspiration_id])
    text_item = TextItem.create(text: text_item_params[:text], writer: writer, inspiration: inspiration, published: text_item_params[:published])
    if text_item.valid?
      render json: text_item, status: 201
    else
      puts text_item.errors.inspect
      render json: { message: 'Unable to create text item.' }, status: 500
    end
  end

  def show
    puts params[:id]
    text_item = TextItem.includes(:ratings, :writer, :inspiration).find(params[:id])
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
