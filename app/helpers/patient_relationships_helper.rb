module PatientRelationshipsHelper

  def send_request_flash_success
    if @relationship.inviter == 'patient'
      flash[:notice] = "Success! You've sent a connection
      request to #{@relationship.doctor}."
    else @relationship.inviter == 'doctor'
      flash[:notice] = "Success! You've sent a connection
      request to #{@relationship.patient}."
    end
  end

  def send_request_flash_failure
    if @relationship.inviter == 'patient'
      flash[:notice] = "Woops. Something went wrong and your
      connection request to #{@relationship.doctor} wasn't sent."
    else @relationship.inviter == 'doctor'
      flash[:notice] = "Woops. Something went wrong and your
      connection request to #{@relationship.patient} wasn't sent."
    end
  end

end
