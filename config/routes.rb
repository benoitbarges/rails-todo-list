Rails.application.routes.draw do
  devise_for :users
  root to: 'todos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todos, only: [:create, :destroy] do
    member do
      post :mark_as_done
      post :mark_as_not_done
    end
  end
end
