Rails.application.routes.draw do
  root 'shared#home'
  get 'signup', to:'users#new'
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'
  resources :users, except: [:new]
end
