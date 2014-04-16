Rails.application.routes.draw do
  resources :templates, except: [:show]
  resources :documents, only: [:show]

  resources :document_submissions, except: [:show, :edit, :update] do
    collection do
      post :with_defaults
    end
  end

  root to: "home#index"
end
