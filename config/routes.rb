Rails.application.routes.draw do
  'mypage/index'
  devise_for :users
  root to: 'homes#index'
  resources :mypage, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
