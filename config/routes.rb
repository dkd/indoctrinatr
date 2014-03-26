Rails.application.routes.draw do
  resources :documents

  resources :document_submissions, except: [:show, :edit, :update] do
    collection do
      post :with_defaults
    end
  end

  resources :templates, except: [:show]

  root to: "home#index"
end
