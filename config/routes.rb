Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard"

  resources :gardens, only: [ :index ] do
    resources :garden_users, only: [ :index, :show ]
  end

  resources :tasks, only: [ :index ] do
    resources :select_tasks, only: [ :index, :update ]
  end

end
