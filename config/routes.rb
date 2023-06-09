Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'

  resources :prototypes ,only:[:index,:new,:create,:show,:edit,:destroy,:update]do
    resources :comments, only: :create
  end
  resources :users, only: [:show,:index]

  resources :user_sign_up, only: [:new, :create], path: 'sign_up'
end
