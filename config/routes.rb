WeightedDemocracy::Application.routes.draw do
  root :to => 'disciplines#index'

  resources :answers
  resources :questions
  resources :disciplines
  resources :users

  match '/login' => 'sessions#new', :as => 'login', :via => :get
  match '/login' => 'sessions#create', :as => 'login', :via => :post
  match '/logout' => 'sessions#destroy', :as => 'logout' 
end
