Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  #resources :orders
  resources :items, only: [:new, :create]
  #resources :buy_datas
end
