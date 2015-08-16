class GetDoctorPhoneNumberWorker
  include Sidekiq::Worker

  def perform(doctor_id)
    doctor = Doctor.find(doctor_id)
    doctor.get_phone_number!
  end
end
