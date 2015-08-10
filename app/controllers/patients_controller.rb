class PatientsController < ApplicationController
  around_action :is_patient_doctor?, only: :show

  def index
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private
  def is_patient_doctor?
    @doctor = Doctor.find(current_doctor.id)
    @patient = Patient.find(params[:id])

    if @patient.doctors.include?(@doctor)
      render params[:action].to_sym
    end
  end

end
