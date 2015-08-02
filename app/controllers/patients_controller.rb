class PatientsController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @patients = Patient.all
  end
end
