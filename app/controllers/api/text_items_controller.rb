class Api::TextItemsController < ApplicationController
 
  def create
    writer = User.find(params[:writer_id])
    inspiration = Inspiration.find(params[:inspiration_id])
    text_item = TextItem.create(title: text_item_params[:title], text: text_item_params[:text], writer: writer, inspiration: inspiration, published: text_item_params[:published])
    if text_item.valid?
      render json: text_item, status: 201
    else
      # puts text_item.errors.inspect
      render json: { message: 'Unable to create text item.' }, status: 500
    end
  end

  def index
    all_text_items = TextItem.includes(:ratings, :writer, :inspiration).all
    render json: all_text_items, include: [:ratings, :writer, :inspiration], methods: :avg_rating, status: 200
  end

  def my_items
    my_user_id = @current_user.id
    my_text_items = TextItem.where(writer_id: my_user_id).includes(:ratings, :writer, :inspiration)
    render json: my_text_items, include: [:ratings, :writer, :inspiration], methods: :avg_rating, status: 200
  end
   
  def published
    published_text_items = TextItem.where(published: true).includes(:ratings, :writer, :inspiration)
    render json: published_text_items, include: [:ratings, :writer, :inspiration], methods: :avg_rating, status: 200
  end

  def show
    text_item = TextItem.includes(:ratings, :writer, :inspiration).find(params[:id])
    if text_item.present?
      render json: text_item, include: [:ratings, :writer, :inspiration], methods: :avg_rating, status: 200
    else
      render json: { message: 'Unable to display, text item does not exist.' }, status: 404
    end
  end

  def update
    text_item = TextItem.find(params[:id])
    if text_item.present?
      updated_text_item = text_item.update(text: text_item_params[:text])
      render json: updated_text_item, status: 200
    else
      render json: { message: 'Cannot find text item to update.' }, status: 404
    end
  end

  def publish
    text_item = TextItem.find(params[:id])
    if text_item.present?
      updated_text_item = text_item.update(published: text_item_params[:published])
      render json: updated_text_item, status: 200
    else
      render json: { message: 'Cannot find text item to update.' }, status: 404
    end
  end

  def destroy
    TextItem.destroy(params[:id])
    render json: { message: 'Text item successfully deleted.' }, status: 200
  end

  def text_item_params
    params.require(:text_item).permit(:title, :text, :published, :writer_id, :inspiration_id)
  end
end
