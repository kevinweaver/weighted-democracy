WeightedDemocracy::Application.routes.draw do
  root :to => 'issues#index'

  resources :users

  resources :issues

  resources :disciplines do
    resources :questions
  end
    
  resources :questions do
    #/questions/1/answers maps to answers#index
    resources :answers
  end

  match '/login' => 'sessions#new', :as => 'login', :via => :get
  match '/login' => 'sessions#create', :as => 'login', :via => :post
  match '/logout' => 'sessions#destroy', :as => 'logout' 
end
