Rails.application.routes.draw do
  root 'shared#home'
  get 'groupChat', to: 'messages#groupChat'
  get 'signup', to:'users#new'
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'
  resources :users, except: [:new]
  resources :messages, only: [:create]
end
