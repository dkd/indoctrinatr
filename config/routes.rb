Rails.application.routes.draw do
  resources :documents

  resources :document_submissions, except: [:show, :edit, :update]

  resources :templates, except: [:show]

  root to: "home#index"
end
