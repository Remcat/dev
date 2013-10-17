Dev::Application.routes.draw do
  resources :appointments

  resources :clients

  root :to => 'application#index'
end
