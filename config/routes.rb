Rails.application.routes.draw do
  root 'sushi_rolls#index'
  resources :sushi_rolls
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
