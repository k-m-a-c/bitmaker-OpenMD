module RelationshipsHelper

  def index_instance_vars
    if current_patient
      @doctors = current_patient.doctors
      @pending_doctor_requests = current_patient.relationships.where("status == 'pending'")
    elsif current_doctor
      @patients = current_doctor.patients
      @pending_patient_requests = current_doctor.relationships.where("status == 'pending'")
    end
  end

end
