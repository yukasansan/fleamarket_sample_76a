Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: :new
  resources :items do
    collection do
      get 'confirmation'
    end
  end
end
