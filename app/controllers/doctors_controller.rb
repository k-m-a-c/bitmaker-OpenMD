class DoctorsController < ApplicationController
  before_filter :authenticate_doctor!

  def index
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def patient
    @patient = current_doctor.patients.find(params[:patient_id])
  end

end
