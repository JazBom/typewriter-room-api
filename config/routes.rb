Rails.application.routes.draw do
  get 'ratings/index'
  get 'ratings/create'
  get 'ratings/show'
  get 'ratings/update'
  get 'ratings/destroy'
  get 'ratings/ratings_params'
  get 'text_items/index'
  get 'text_items/create'
  get 'text_items/show'
  get 'text_items/update'
  get 'text_items/destroy'
  get 'text_items/text_item_params'
  get 'inspirations/index'
  get 'inspirations/create'
  get 'inspirations/show'
  get 'inspirations/update'
  get 'inspirations/destroy'
  get 'inspirations/inspiration_params'
  get 'index/create'
  get 'index/show'
  get 'index/update'
  get 'index/destroy'
  get 'index/inspiration_params'
  namespace :api do
    post 'auth/login', to: 'auth#login'
    resources :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
