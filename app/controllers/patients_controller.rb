class PatientsController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def doctor
    @doctor = current_patient.doctors.find(params[:doctor_id])

  end

  def status
    @patient = current_patient
    @health_status_updates = current_patient.health_status_updates

    @all_vitals_chart_data = [
      {
        name: "respiratory rate",
        data: @health_status_updates.map{|u|
         [u.created_at, u.respiratory_rate]
        }
      },
      {
        name: "heart rate",
        data: @health_status_updates.map{|u|
         [u.created_at, u.heart_rate]
        }
      },
      {
        name: "body temperature",
        data: @health_status_updates.map{|u|
         [u.created_at, u.body_temperature]
        }
      },
      {
        name: "blood pressure",
        data: @health_status_updates.map{|u|
         [u.created_at, u.blood_pressure]
        }
      },
      {
        name: "physical health score",
        data: @health_status_updates.map{|u|
         [u.created_at, u.physical_health_score]
        }
      },
      {
        name: "mental health score",
        data: @health_status_updates.map{|u|
         [u.created_at, u.mental_health_score]
        }
      }
    ]

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

  def data_by_value
    @vitals = current_patient.vitals
    render json: @vitals.chart_json
  end

  def show
    @patient = Patient.find(params[:id])
  end

end