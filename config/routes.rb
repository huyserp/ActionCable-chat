Rails.application.routes.draw do
  devise_for :users
  root to: 'chatrooms#index'

  resources :chatrooms, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:create, :edit, :destroy]
  end
end
