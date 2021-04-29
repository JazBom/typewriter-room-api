Rails.application.routes.draw do
  namespace :api do
    post 'auth/login', to: 'auth#login'
    resources :users
    get 'text_items/my_items', to: 'text_items#my_items'
    get 'text_items/published', to: 'text_items#published'
    resources :text_items
    resources :inspirations
    resources :ratings
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
