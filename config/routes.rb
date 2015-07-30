Rails.application.routes.draw do
  devise_for :patients
  root 'welcome#index'

  resources :patients
  resources :doctors
  resources :health_records
  resources :health_status_updates
end
