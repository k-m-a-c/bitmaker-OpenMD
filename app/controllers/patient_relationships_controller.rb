class PatientRelationshipsController < ApplicationController
  before_filter :authenticate_patient!

  def doctors
    @doctors = current_patient.doctors
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = current_patient.relationships.build(
      :doctor_id => params[:doctor_id],
      status: 'pending',
      inviter: 'patient'
    )

    if @relationship.save
      flash[:notice] = "You've sent a connection
      request to Dr. #{@relationship.doctor.last_name}."
      redirect_to patients_url

    else
      flash[:error] = "Unable to send connection request."
      redirect_to patients_url
    end
  end

  def pending
    @pending = current_patient.relationships.where("status = ?", 'pending')
  end

  def accept
    @relationship = Relationship.find(params[:id])
    @relationship.status = 'accepted'
    if @relationship.save
      redirect_to relationships_url
    else
      render :pending
    end
  end

  def reject
    @relationship = Relationship.find(params[:id])
    @relationship.status = 'rejected'
    if @relationship.save
      redirect_to relationships_url
    else
      render :index
    end
  end

  def delete
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    if patient_doctors_path
      flash[:notice] = "Connection request cancelled."
    else
      flash[:notice] = "Doctor removed."
    end
    redirect_to patient_doctors_url
  end

  private
  def relationship_params
    params.require(:relationship).permit(:doctor_id, :relationship_id)
  end
end