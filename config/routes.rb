Rails.application.routes.draw do
  devise_for :user

  root "users#index"
end
