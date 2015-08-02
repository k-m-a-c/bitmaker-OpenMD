class HealthStatusUpdatesController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @health_status_updates = HealthStatusUpdate.all
  end

  def show
    @health_status_update = HealthStatusUpdate.find(params[:id])
  end

  def new
    @health_status_update = HealthStatusUpdate.new
  end

  def edit
  end

  def create
    @health_status_update = HealthStatusUpdate.new(health_status_updates_params)

    if @healthstatusupdate.save
      redirect_to health_status_updates_url
    else
      render :new
    end
  end

  def update
  end

  private
  def health_status_updates_params
    params.require(:health_status_update).permit(:respiratory_rate, :heart_rate, :body_temperature, :blood_pressure, :physical_health_score, :mental_health_score)
  end

end