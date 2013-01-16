WeightedDemocracy::Application.routes.draw do
  resources :issues


  root :to => 'disciplines#index'

  resources :disciplines do
    resources :questions
  end
    
  resources :questions do
    resources :answers
  end
 
  resources :users

  match '/login' => 'sessions#new', :as => 'login', :via => :get
  match '/login' => 'sessions#create', :as => 'login', :via => :post
  match '/logout' => 'sessions#destroy', :as => 'logout' 
end
