class HealthRecordsController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @health_records = HealthRecord.all
  end

  def show
    @health_record = HealthRecord.find_by(:patient => current_patient.id)

    if @health_record.present? == false
      redirect_to new_patient_health_record_url
    end
  end

  def new
    @health_record = HealthRecord.new
  end

  def create
    @health_record = HealthRecord.new(health_record_params)
    @health_record.patient = current_patient
    current_patient.health_record = @health_record

    if @health_record.save && current_patient.save
      redirect_to patient_health_record_url
    else

      render :new
    end
  end

  def edit
    @health_record = HealthRecord.find_by(:patient => current_patient.id)
  end

  def update
    @health_record = HealthRecord.find_by(:patient => current_patient.id)
    @health_record.update_attributes(health_record_params)

    if @health_record.save
      redirect_to patient_health_record_url
    else
      render :edit
    end
  end

  def destroy
      @health_record = HealthRecord.find_by(:patient => current_patient.id)
      @health_record.destroy
      redirect_to patients_path
  end

  private
  def health_record_params
    params.require(:health_record).permit(
      :allergies,
      :medications,
      :surgeries,
      :existing_conditions)
  end
end