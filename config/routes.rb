Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users
  root to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard"

  resources :gardens, only: [ :index ] do
    resources :garden_users, only: [ :index, :show ]
  end

  resources :tasks, only: [ :index ]
  resources :select_tasks, only: [ :index, :update, :new, :create, :destroy ]
  patch 'select_tasks/:id', to: 'select_tasks#complete'

  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

end
