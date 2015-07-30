class Patient::ParameterSanitizer < Devise::ParameterSanitizer

  def sign_up
    default_params.permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :healthcard_number,
      :gender,
      :date_of_birth,
      :city,
      :country,
      :password,
      :password_confirmation
    )
  end
end