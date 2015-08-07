module DoctorsHelper

  def show_doctor_connection_link(patient)
    if current_doctor.patients.include?(patient)
      connection = current_doctor.relationships.find_by(patient_id: patient.id).id

      link_to "Remove connection", delete_doctor_connection_path(
        :doctor_id => current_doctor.id,
        :patient_id => patient.id,
        :id => connection),
      :method => :post
    else
      link_to "Send connection request", doctor_connection_request_path(
        :doctor_id => current_doctor.id,
        :patient_id => patient.id),
      :method => :post
    end
  end

end
