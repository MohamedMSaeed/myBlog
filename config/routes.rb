Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end
  devise_for :users
  root 'posts#index'
  resources :users


  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
