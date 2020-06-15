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
  
  resources :users, only: :new
  resources :items
  resources :mypage, only: [:index] do
    collection do
      get 'logout'
    end
  end
  
  resources :cards do
    member do
      get 'confirmation'
      post 'pay'
      get 'complete'
    end
  end
end
