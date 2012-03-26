ManUp::Application.routes.draw do

  root to: 'pages#index'
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  resources :essays, only: :show
  resources :resources
  
  namespace :admin do
    resources :essays
  end
  
end
