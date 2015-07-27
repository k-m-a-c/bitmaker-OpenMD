Rails.application.routes.draw do
  root 'welcome#index'

  resources :patients
end
