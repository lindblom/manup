ManUp::Application.routes.draw do
  root to: 'pages#index'
  
  resources :essays, only: :show
  
  namespace :admin do
    resources :essays
  end
  
end
