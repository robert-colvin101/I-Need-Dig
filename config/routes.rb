Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'profile', to: 'pages#profile'

  resources :properties do
    resources :bookings, only:[:new, :create, :update, :edit, :index]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

