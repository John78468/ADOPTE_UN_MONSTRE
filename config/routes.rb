Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contracts
  get 'profil/:id', to: 'pages#profil', as: :profil
  resources :monsters do
    resources :contracts, only: [:create, :new]
  end
  patch '/profil/:user_id/contracts/:id', to: 'contracts#update'
  get '/contracts/:id/decline', to: 'contracts#decline', as: 'decline'
  get '/monsters/:id/on', to: 'monsters#on', as: 'monster_on'
  get '/monsters/:id/off', to: 'monsters#off', as: 'monster_off'
end
