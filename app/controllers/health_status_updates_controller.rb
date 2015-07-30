class HealthStatusUpdatesController < ApplicationController

  def index
    @healthstatusupdates = HealthStatusUpdates.all
  end

  def show
    @healthstatusupdate = HealthStatusUpdate.find(params[:id])
  end

  def new
    @healthstatusupdate = HealthStatusUpdate.new
  end

  def edit
  end

  def create
    @healthstatusupdate = HealthStatusUpdate.new(healthrecord_params)

    if @healthstatusupdate.save
      redirect_to healthstatusupdates_url
    else
      render :new
    end
  end

  def update
  end

  private
  def healthstatusupdates_params
    params.require(:healthstatusupdates).permit()
  end

end