class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_url
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email, :phone_number,
      :doctor_uid, :gender, :specialization, :institution, :city, :country,
      :password, :password_confirmation)
  end

end
