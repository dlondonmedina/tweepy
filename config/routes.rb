Rails.application.routes.draw do
  resources :tweeps
  root "tweeps#index"

end
