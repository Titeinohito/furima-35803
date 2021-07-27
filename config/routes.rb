Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  #resources :orders
  resources :items, only: [:index ,:new, :create, :show]
  #resources :buy_datas
end
