class DoctorRelationshipsController < ApplicationController
  before_filter :authenticate_doctor!
  around_action :is_patients_doctor?, only: :patient

  def patient
    @patient = current_doctor.patients.find(params[:id])
    @health_status_updates = @patient.health_status_updates

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

  def patients
    @patients = current_doctor.patients
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = current_doctor.relationships.build(
      :patient_id => params[:patient_id],
      status: 'pending',
      inviter: 'doctor'
    )

    if @relationship.save
      flash[:notice] = "You've sent a connection
      request to #{@relationship.patient.first_name} #{@relationship.patient.last_name}."
      redirect_to doctors_url

    else
      flash[:error] = "Unable to send connection request."
      redirect_to doctors_url
    end
  end

  def pending
    @your_requests = current_doctor.relationships.where("status = ?", 'pending' && "inviter =?", 'doctor')
    @patient_requests = current_doctor.relationships.where("status = ?", 'pending' && "inviter =?", 'patient')
  end

  def accept
    @relationship = Relationship.find(params[:id])
    @relationship.status = 'accepted'
    if @relationship.save
      redirect_to doctor_patients_url
    else
      render :pending
    end
  end

  def delete
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    if doctor_patients_path
      flash[:notice] = "Connection request cancelled."
    else
      flash[:notice] = "Patient removed."
    end
    redirect_to doctor_patients_url
  end

  private
  def relationship_params
    params.require(:relationship).permit(:patient_id, :relationship_id)
  end

  def is_patients_doctor?
    @doctor = Doctor.find(current_doctor.id)
    @patient = Patient.find(params[:id])

    if @patient.doctors.include?(@doctor)
      render params[:action].to_sym
    else
      render file: 'public/401.html', status: :unauthorized, layout: false
    end
  end
end
