Rails.application.routes.draw do
  devise_for :users
  root to: "pages#entry"
  get 'profile', to: 'pages#profile'
  get 'home', to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'becomeahost', to: 'pages#become_a_host.html.erb'
  resources :properties do
    resources :bookings, only:[:new, :create, :update, :edit, :index]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

