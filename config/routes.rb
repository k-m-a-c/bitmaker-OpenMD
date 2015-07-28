Rails.application.routes.draw do
  root 'welcome#index'

  resources :patients do
    resources :health_records
    resources :health_status_updates
  end
  resources :doctors
end
