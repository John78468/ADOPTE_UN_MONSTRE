Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contracts
  get 'profil/:id', to: 'pages#profil', as: :profil
  patch 'profil/:id', to: 'pages#profil_update'
  resources :monsters do
    resources :contracts, only: [:create, :new]
  end
  patch '/profil/:user_id/contracts/:id', to: 'contracts#update'
  patch "decline", to: "contracts#decline", as: "decline"

end
