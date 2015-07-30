class HealthStatusUpdatesController < ApplicationController

  def index
    @healthstatusupdates = HealthStatusUpdate.all
  end

  def show
    @healthstatusupdate = HealthStatusUpdate.find(params[:health_status_update_id])
  end

  def new
    @healthstatusupdate = HealthStatusUpdate.new
    @patient = Patient.first
    #Replace this with current_patient/sessions
  end

  def edit
  end

  def create
    @healthstatusupdate = HealthStatusUpdate.new(healthstatusupdates_params)

    if @healthstatusupdate.save
      redirect_to health_status_updates_url
    else
      render :new
    end
  end

  def update
  end

  private
  def healthstatusupdates_params
    params.require(:health_status_update).permit(:respiratory_rate, :heart_rate, :body_temperature, :blood_pressure, :physical_health_score, :mental_health_score)
  end

end