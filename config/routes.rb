ManUp::Application.routes.draw do
  
  root to: 'pages#index'
  
  resources :essays, only: :show
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  namespace :admin do
    resources :essays
  end
  
end
