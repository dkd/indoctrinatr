Rails.application.routes.draw do
  resources :submitted_template_fields

  resources :document_submissions

  resources :templates

  root to: "home#index"
end
