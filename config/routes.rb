Rails.application.routes.draw do
  devise_for :users
 root to: 'prototypes#index'

# resources :user_sign_up, only: [:new, :create], path: 'sign_up'
 #resources :sign_up, only: [:new,:create]

end
