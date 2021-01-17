Rails.application.routes.draw do
  devise_for :users
  root to: 'todos#index'

  resources :todos, only: [:index, :create, :destroy] do
    member do
      post :toggle_done
      patch :move
      patch :update_deadline
    end

    resources :comments, only: :create
  end

  resources :comments, only: :destroy
end
