ManUp::Application.routes.draw do
  get "essays/show"

  root to: 'pages#index'
  
  resources :essays
end
