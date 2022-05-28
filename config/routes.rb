Rails.application.routes.draw do
  devise_for :users
  root to: 'prefectures#index'
  resources :prefectures , only: :show
  resources :contents , only: [:new, :create, :show] do
    collection do
      get 'search'
    end
  end
end
