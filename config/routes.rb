Dev::Application.routes.draw do
  resources :clients

  root :to => 'visitors#new'
end
