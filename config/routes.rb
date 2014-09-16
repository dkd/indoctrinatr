Rails.application.routes.draw do
  get '/contact' => 'pages#contact'
  get '/documentation' => 'pages#documentation'

  resources :documents, only: %i(show)
  resources :template_packs

  namespace :api do
    resources :templates do
      member do
        get :generate
        get :error_log
      end
    end
  end

  resources :templates, except: %i(show) do
    member do
      get :document_submissions
    end
  end

  resources :document_submissions, except: %i(show, edit, update) do
    collection do
      post :with_defaults
    end
  end

  root to: 'home#index'
end
