Rails.application.routes.draw do
  get '/contact' => 'pages#contact'
  get '/documentation' => 'pages#documentation'

  resources :template_packs, only: %i(new create show)

  resources :templates, except: %i(show) do
    member do
      get :document_submissions
    end
  end

  resources :document_submissions, except: %i(edit update) do
    collection do
      post :with_defaults
    end
  end

  post '/api/v1/templates/:id/generate' => 'api/v1/templates#generate'

  root to: 'home#index'
end
