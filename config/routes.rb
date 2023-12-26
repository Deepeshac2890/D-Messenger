Rails.application.routes.draw do
  root 'articles#home'
  get 'signup', to:'users#new'
  resources :users, except: [:new]
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
