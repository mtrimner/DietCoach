Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }

  resources :users do
    resources :diets, only: [:new, :create, :show]
    resources :user_stats, only: [:new, :create, :edit, :update]
  end
  resources :diets, only: [:edit, :update]
  

  resources :meals do
    resources :foods, only: [:new, :create, :index]
  end
  resources :foods

  root to: "home#index"
end
