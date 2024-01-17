Rails.application.routes.draw do
  root 'articles#home'
  get 'signup', to:'users#new'
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
