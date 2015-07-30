class HealthRecordsController < ApplicationController

  def index
    @healthrecords = HealthRecord.all
  end

  def show
    @healthrecord = HealthRecord.find(params[:id])
  end

  def new
    @healthrecord = HealthRecord.new

  end

  def edit
  end

  def create
    @healthrecord = HealthRecord.new(health_record_params)

    if @healthrecord.save
      redirect_to health_records_url
    else
      render :new
    end
  end

  def update
  end

  def destroy
      @healthrecord = HealthRecord.find(params[:id])
      @healthrecord.destroy
      redirect_to health_records_url
  end

  private
  def healthrecords_params
    params.require(:health_record).permit(
      :allergies,
      :medications,
      :surgeries,
      :existing_conditions)
  end
end