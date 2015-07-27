Rails.application.routes.draw do
  root 'welcome#index'

  resources :patients
  resources :doctors
end
