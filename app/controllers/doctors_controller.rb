class DoctorsController < ApplicationController
  before_filter :authenticate_doctor!

  def index
    @doctors = Doctor.all
  end

end
