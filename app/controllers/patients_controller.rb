class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit

  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_url
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone_number,
      :healthcard_number, :gender, :date_of_birth, :city, :country)
  end
end
