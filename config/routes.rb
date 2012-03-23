ManUp::Application.routes.draw do
  root to: 'pages#index'
  
  resources :essays, only: :show
  
end
