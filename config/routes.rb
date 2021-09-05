Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :companies
  resources :event_categories
  resources :events
  resources :industries
  resources :job_categories
  resources :selection_statuses
  resources :wish_degrees
  resource :user, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
