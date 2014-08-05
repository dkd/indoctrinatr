Rails.application.routes.draw do

  namespace :api do
    resources :templates do
      member do
        get :generate
        get :error_log
      end
    end
  end

  resources :templates, except: [:show] do
    member do
      get :document_submissions
    end
  end
  resources :documents, only: [:show]

  resources :document_submissions, except: [:show, :edit, :update] do
    collection do
      post :with_defaults
    end
  end

  resources :template_packs

  root to: "home#index"

  get '/contact' => 'pages#contact'
  get '/documentation' => 'pages#documentation'

end
