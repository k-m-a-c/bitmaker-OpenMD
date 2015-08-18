class PatientsController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def status
    @health_status_updates = current_patient.health_status_updates
    @respiratory_rate = current_patient.respiratory_rate
    @heart_rate = current_patient.heart_rate

    @respiratory_chart_data = {}
    @health_status_updates.each do |u|
      @respiratory_chart_data[u.created_at] = u.respiratory_rate
    end

    @heart_rate_chart_data = {}
    @health_status_updates.each do |u|
      @heart_rate_chart_data[u.created_at] = u.heart_rate
    end

    @body_temp_chart_data = {}
    @health_status_updates.each do |u|
      @body_temp_chart_data[u.created_at] = u.body_temperature
    end

    @blood_pressure_chart_data = {}
    @health_status_updates.each do |u|
      @blood_pressure_chart_data[u.created_at] = u.blood_pressure
    end

    @physical_health_chart_data = {}
    @health_status_updates.each do |u|
      @physical_health_chart_data[u.created_at] = u.physical_health_score
    end

    @mental_health_chart_data = {}
    @health_status_updates.each do |u|
      @mental_health_chart_data[u.created_at] = u.mental_health_score
    end

  end

  def show
    @patient = Patient.find(params[:id])
  end

end
