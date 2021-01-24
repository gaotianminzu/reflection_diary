Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' } 
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :comments,only: %i(create destroy)
  end
  resources :home, only: [:index]

  root to: "home#index"
  get 'posts/search'
end
