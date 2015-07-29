Rails.application.routes.draw do
  root 'welcome#index'

# Patient Session Routes

  resources :patient_sessions

  get 'patient_login' => 'patient_sessions#new', :as => :login
  post 'patient_logout' => 'patient_sessions#destroy', :as => :logout


# Doctor Session Routes
  resources :doctor_sessions

  get 'doctor_login' => 'doctor_sessions#new', :as => :doctor_login
  post 'doctor_logout' => 'doctor_sessions#destroy', :as => :doctor_logout

  resources :patients do
    resources :health_records
    resources :health_status_updates
  end
  resources :doctors
end
