Rails.application.routes.draw do
  root "municipes#index"
  resources :municipes, except: [:destroy]
end
