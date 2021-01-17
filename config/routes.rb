Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' } 
  resources :posts, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"

end
