Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profil/:id', to: 'pages#profil'
  patch 'profil/:id', to: 'pages#profil_update'
  resources :monsters do
    resources :contracts, only: :create
  end
  patch '/profil/:user_id/contracts/:id', to: 'contracts#update'
end
