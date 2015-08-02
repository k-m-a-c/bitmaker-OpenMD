module ApplicationHelper
  def show_session_links
    if patient_signed_in?
      link_to 'Log Out', destroy_patient_session_path, method: :delete
    elsif doctor_signed_in?
      link_to 'Log Out', destroy_doctor_session_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

  def show_patient_links
    link_to_unless_current('My Health Record',
      patient_health_record_path(current_patient.id))
  end
end
