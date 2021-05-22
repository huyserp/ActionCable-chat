Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :users
  root to: 'chatrooms#index'

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: [:create, :edit, :destroy]
  end
end
