Rails.application.routes.draw do

  resources :books, only: [:new, :edit, :index, :show, :create, :destroy, :update]
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
