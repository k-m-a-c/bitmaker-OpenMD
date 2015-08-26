module ApplicationHelper

  def show_home_link
    if patient_signed_in?
      link_to 'OpenMD', patients_path
    elsif doctor_signed_in?
      link_to 'OpenMD', doctors_path
    else
      link_to 'OpenMD', root_path
    end
  end

  def show_health_record_link
    if patient_signed_in?
      link_to_unless_current('My Health Status',
        patient_status_path(current_patient.id)
      )
    end
  end

  def show_health_status_update_link
    if patient_signed_in?
      link_to_unless_current('+ Health Status Update',
        new_patient_health_status_update_path(current_patient.id)
      )
    end
  end

  def show_connections_link
    if patient_signed_in?
      link_to_unless_current('Your Doctors',
        patient_doctors_path(current_patient))
    elsif doctor_signed_in?
      link_to_unless_current('Your Patients',
        doctor_patients_path(current_doctor))
    end
  end

  def show_account_link
    if patient_signed_in?
      link_to_unless_current('Account', patient_path(current_patient.id))
    elsif doctor_signed_in?
      link_to_unless_current('Account', doctor_path(current_doctor.id))
    else
    end
  end

  def show_session_links
    if patient_signed_in?
      link_to 'Log Out', destroy_patient_session_path, method: :delete
    elsif doctor_signed_in?
      link_to 'Log Out', destroy_doctor_session_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

end
