require 'sidekiq/web'

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

  # Doctor Verification Routes
  get 'doctors/verify', to: 'doctors#show_verify', as: 'verify'
  post 'doctors/verify'
  post 'doctors/resend'

  # Patient Routes
  resources :patients, only: [:index, :show] do
    resource :health_record
    resources :health_status_updates
  end

  get '/patients/:patient_id/status', to: 'patients#status',
    as: 'patient_status'

  get '/patients/:patient_id/data_by_value', to: 'patients#data_by_value',
    as: 'data_by_value'

  # Doctor Routes
  resources :doctors, only: [:index, :show]

  # Patient 'Friending' Routes

  # GET New
  get '/patients/:patient_id/doctor_request/new',
    to: 'patient_relationships#new', as: 'new_patient_connection_request'

  # POST Create
  post '/patients/:patient_id/doctor_request',
    to: 'patient_relationships#create', as: 'patient_connection_request'

  # PATCH Accept
  patch '/patients/:patient_id/doctor_request/:id/accept',
    to: 'patient_relationships#accept', as: 'patient_accept_request'

  # GET Pending
  get '/patients/:patient_id/pending_doctor_requests',
  to: 'patient_relationships#pending', as: 'patient_pending_connections'

  # GET Doctors
  get '/patients/:patient_id/doctors', to: 'patient_relationships#doctors',
    as: 'patient_doctors'

  # DELETE Connection
  delete '/patients/:patient_id/doctors/:id',
    to: 'patient_relationships#delete', as: 'delete_patient_connection'

  # Doctor 'Friending' Routes

  # GET New
  get '/doctors/:doctor_id/patient_request/new',
    to: 'doctor_relationships#new', as: 'new_doctor_connection_request'

  # POST Create
  post '/doctors/:doctor_id/patient_request',
    to: 'doctor_relationships#create', as: 'doctor_connection_request'

  # PATCH Accept
  patch '/doctors/:doctor_id/patient_request/:id/accept',
    to: 'doctor_relationships#accept', as: 'doctor_accept_request'

  # GET Pending
  get '/doctors/:doctor_id/pending_patient_requests',
  to: 'doctor_relationships#pending', as: 'doctor_pending_connections'

  # GET a Specific Patient
  get 'doctors/patient/:id',
    to: 'doctor_relationships#patient', as: 'doctor_patient'

  # GET Patients
  get '/doctors/:doctor_id/patients', to: 'doctor_relationships#patients',
    as: 'doctor_patients'

  # DELETE Connection
  delete '/doctors/:doctor_id/patients/:id',
    to: 'doctor_relationships#delete', as: 'delete_doctor_connection'

  # Web interface for monitoring sidekiq
  mount Sidekiq::Web, at: '/sidekiq'

end
