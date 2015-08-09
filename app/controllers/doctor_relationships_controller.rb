class DoctorRelationshipsController < ApplicationController
  before_filter :authenticate_doctor!

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

end
