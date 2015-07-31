Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'welcome#show'

  # Auth Routes
  devise_for :doctors, controllers: {
    registrations: 'doctors/registrations',
    sessions: 'doctors/sessions'
  }

  devise_for :patients, controllers: {
    registrations: 'patients/registrations',
    sessions: 'patients/sessions'
  }

  resources :patients, only: [:index]
  resources :doctors, only: [:index]

  resources :health_records
  resources :health_status_updates
end
