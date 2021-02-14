Rails.application.routes.draw do
  devise_for :users
  resources :tweeps
  root "tweeps#index"

end
