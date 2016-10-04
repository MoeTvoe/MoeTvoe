Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :items do
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end
  resources :users, only: [:show, :edit, :update]
end
