Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :groups
    end
  end
  
  resources :calendars
  resources :groups, only: [:new, :show, :create, :edit, :update, :destroy] do
    member do
      get :calendar
      get :events
      get :posts
    end
  end
  resources :group_calendars, only: [:show, :create, :edit, :update, :destroy]
  resources :posts, only: [:create, :edit, :update, :destroy]
  
end
