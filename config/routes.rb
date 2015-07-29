Rails.application.routes.draw do
  devise_for :patients
  root 'welcome#index'

  resources :patients
  resources :doctors
end
