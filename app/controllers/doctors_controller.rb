class DoctorsController < ApplicationController
  before_filter :authenticate_doctor!

  def index
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find_by(:doctor => current_doctor.id)
  end

  def update
    @doctor = Doctor.find_by(:doctor => current_doctor.id)
    @doctor.update_attributes(doctor_params)

    if @doctor.save
      redirect_to doctor_url
    else
      render :edit
    end
  end

private
def doctor_params

end

end
