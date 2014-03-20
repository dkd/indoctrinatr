Rails.application.routes.draw do
  resources :document_submissions, except: [:show]

  resources :templates, except: [:show]

  root to: "home#index"
end
