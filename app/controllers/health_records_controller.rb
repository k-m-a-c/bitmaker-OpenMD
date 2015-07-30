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
    @healthrecord = HealthRecord.new(healthrecord_params)

    if @healthrecord.save
      redirect_to healthrecords_url
    else
      render :new
    end
  end

  def update
  end

  def destroy
      @healthrecord = HealthRecord.find(params[:id])
      @healthrecord.destroy
      redirect_to healthrecords_url
  end

  private
  def healthrecords_params
    params.require(:healthrecords).permit()
  end
end