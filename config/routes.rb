Rails.application.routes.draw do
  resources :templates

  root to: "home#index"
end
