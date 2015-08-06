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

  resources :patients, only: [:index, :show] do
    resource :health_record
    resources :health_status_updates
  end

  resources :doctors, only: [:index, :show]

  # Patient 'Friending' Routes
  get '/patients/:patient_id/connection_request/new',
    to: 'patient_relationships#new', as: 'new_patient_connection_request'

  post '/patients/:patient_id/connection_request',
    to: 'patient_relationships#create', as: 'patient_connection_request'

  patch '/patients/:patient_id/connection_request/:id',
    to: 'patient_relationships#accept'

  patch '/patients/:patient_id/connection_request/:id',
    to: 'patient_relationships#reject'

  get '/patients/:patient_id/pending_connections',
  to: 'patient_relationships#pending', as: 'patient_pending_connections'

  get '/patients/:patient_id/doctors', to: 'patient_relationships#doctors',
    as: 'patient_doctors'

  delete '/patients/:patient_id/connection_request/:id',
    to: 'patient_relationships#delete', as: 'delete_patient_connection'

end
