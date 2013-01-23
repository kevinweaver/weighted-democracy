WeightedDemocracy::Application.routes.draw do
  root :to => 'issues#index'

  resources :users

  resources :issues do
    resources :disciplines
  end

  #resources :disciplines do
  #  resources :issues
  #end

  resources :disciplines do
    resources :questions
  end
    
  resources :questions do
    resources :answers
  end
 

  match '/login' => 'sessions#new', :as => 'login', :via => :get
  match '/login' => 'sessions#create', :as => 'login', :via => :post
  match '/logout' => 'sessions#destroy', :as => 'logout' 
end
