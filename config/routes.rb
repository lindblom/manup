ManUp::Application.routes.draw do
  root to: 'pages#index'
  
  get "sitemap" => "pages#sitemap", defaults: { format: "xml" }
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  resources :essays, only: [:show, :index]
  resources :resources
  
  namespace :admin do
    resources :essays
    resources :resources
  end
  
end
