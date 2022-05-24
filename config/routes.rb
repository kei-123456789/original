Rails.application.routes.draw do
  devise_for :users
  root to: 'prefectures#index'
  resources :prefectures , only: :show
  resources :contents , only: :index
end
