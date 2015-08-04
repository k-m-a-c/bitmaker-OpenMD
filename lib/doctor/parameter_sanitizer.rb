class Doctor::ParameterSanitizer < Devise::ParameterSanitizer

  def sign_up
    default_params.permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :doctor_uid,
      :gender,
      :specialization,
      :institution,
      :city,
      :country,
      :password,
      :password_confirmation
    )
  end

  def account_update
    default_params.permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :doctor_uid,
      :gender,
      :specialization,
      :institution,
      :city,
      :country,
      :current_password,
      :password,
      :password_confirmation
    )
  end

end