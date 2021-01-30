Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' } 
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update] do
    collection do
      get 'search_key'
      get 'my_search_key'
    end
    resources :comments,only: [:create, :destroy]
    resources :likes,only: [:create, :destroy]
  end
  resources :home, only: [:index]
  resources :users, only: [:show]
  root to: "home#index"
  get 'posts/search' 
  get 'posts/search_me'
end
