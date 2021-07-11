Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  resources :orders
  resources :items
  resources :buy_datas
end
