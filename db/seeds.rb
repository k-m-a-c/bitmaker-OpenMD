# Provide list of initial doctors
doctor_list = [
  {
    first_name: "Sherylan",
    last_name: "Young",
    email: "s.young@gmail.com",
    doctor_uid: 68216,
    gender: "female",
    specialization: "Family Medicine",
    institution: "Sunnybrook Health Sciences Centre",
    city: "Toronto",
    country: "Canada"
  },
  {
    first_name: "Georg",
    last_name: "Bjarnason",
    email: "g.bjarnason@gmail.com",
    doctor_uid: 53164,
    gender: "male",
    specialization: "Medical Oncology",
    institution: "Sunnybrook Odette Cancer Centre",
    city: "Toronto",
    country: "Canada"
  },
  {
    first_name: "Fahad",
    last_name: "Razak",
    email: "f.razak@gmail.com",
    doctor_uid: 90866,
    gender: "male",
    specialization: "Internal Medicine",
    institution: "St. Michael's Hospital"
  }
]

# Create each doctor in the list
doctor_list.each do |doctor|

  Doctor.create(
    first_name: doctor[:first_name],
    last_name: doctor[:last_name],
    email: doctor[:email],
    doctor_uid: doctor[:doctor_uid],
    gender: doctor[:gender],
    specialization: doctor[:specialization],
    institution: doctor[:institution]
  )
end

# Provide list of initial patients
patient_list = [
  {
    first_name: "Kevin",
    last_name: "McLoughlin",
    email: "kevinmcloughlin2010@gmail.com",
    phone_number: 4166601435,
    healthcard_number: "5584486674KM",
    gender: "male",
    date_of_birth: Date.new(1988,5,2),
    city: "Toronto",
    country: "Canada"
  },
  {
    first_name: "Stephen",
    last_name: "McLoughlin",
    email: "stephenmmcloughlin@gmail.com",
    healthcard_number: "5584486674SM",
    gender: "male",
    date_of_birth: Date.new(1990,8,1),
    city: "Toronto",
    country: "Canada"
  },
  {
    first_name: "Stephanie",
    last_name: "McLoughlin",
    email: "stephanie.mcloughlin27@gmail.com",
    healthcard_number: "7784486674SM",
    gender: "female",
    date_of_birth: Date.new(1992,10,27),
    city: "Toronto",
    country: "Canada"
  },
  {
    first_name: "Michael",
    last_name: "McLoughlin",
    email: "michael.mcloughlin@sunlife.com",
    healthcard_number: "7784486674MM",
    gender: "male",
    date_of_birth: Date.new(1955,12,14),
    city: "Toronto",
    country: "Canada"
  }
]

# Create each patient in the list
patient_list.each do |patient|

  Patient.create(
    first_name: patient[:first_name],
    last_name: patient[:last_name],
    email: patient[:email],
    phone_number: patient[:phone_number],
    healthcard_number: patient[:healthcard_number],
    gender: patient[:gender],
    date_of_birth: patient[:date_of_birth],
    city: patient[:city],
    country: patient[:country]
  )
end

# Provide list of initial health records
health_record_list = [
  {
    allergies: "Mold spore, lactose, gluten",
    medications: "None",
    surgeries: "None",
    existing_conditions: "None"
  },
  {
    allergies: "Dust mites, gluten",
    medications: "None",
    surgeries: "Tommy John surgery",
    existing_conditions: "None"
  },
  {
    allergies: "Shellfish, red wine, gluten",
    medications: "None",
    surgeries: "None",
    existing_conditions: "None"
  }
]

# Create each health record on the list
health_record_list.each do |record|

  HealthRecord.create(
    allergies: record[:allergies],
    medications: record[:medications],
    surgeries: record[:surgeries],
    existing_conditions: record[:existing_conditions]
  )
end

# health_records = HealthRecord.all
# patients = Patient.all

# health_records.each do |record|
#   patients.each do |patient|
#     health_record.patient = patient
#   end
# end