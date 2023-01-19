Rails.application.routes.draw do
  devise_for :users
  get 'plans/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "plans#index"
  resources :plans do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end
