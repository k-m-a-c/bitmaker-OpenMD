Rails.application.routes.draw do

  root 'welcome#index'

  # Auth Routes
  devise_for :doctors, controllers: {
    registrations: 'doctors/registrations',
    sessions: 'doctors/sessions'
  }

  devise_for :patients, controllers: {
    registrations: 'patients/registrations',
    sessions: 'patients/sessions'
  }

  # Feature Routes
  resources :patients, only: [:index]
  resources :doctors, only: [:index]
end
