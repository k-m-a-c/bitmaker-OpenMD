class PatientsController < ApplicationController

  def index
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
