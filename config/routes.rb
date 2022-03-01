Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gardens, only: [ :index ] do
    resources :garden_users, only: [ :index, :show ]
  end

  resources :users do
    resources :select_tasks, only: [ :index, :update ]
  end

  resources :tasks, only: [ :index ]

end
