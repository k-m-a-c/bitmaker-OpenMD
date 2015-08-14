# Provide list of initial doctors
doctor_list = [
  {
    first_name: "Sherylan",
    last_name: "Young",
    email: "kevinmcloughlin2010+dryoung@gmail.com",
    doctor_uid: 68216,
    gender: "female",
    specialization: "Family Medicine",
    institution: "Sunnybrook Health Sciences Centre",
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  },
  {
    first_name: "Georg",
    last_name: "Bjarnason",
    email: "kevinmcloughlin2010+drbjarnason@gmail.com",
    doctor_uid: 53164,
    gender: "male",
    specialization: "Medical Oncology",
    institution: "Sunnybrook Odette Cancer Centre",
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  },
  {
    first_name: "Fahad",
    last_name: "Razak",
    email: "kevinmcloughlin2010+drrazak@gmail.com",
    doctor_uid: 90866,
    gender: "male",
    specialization: "Internal Medicine",
    institution: "St. Michael's Hospital",
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  }
]

# Create each doctor in the list
doctor_list.each do |doctor|
  Doctor.create(doctor)
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
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  },
  {
    first_name: "Stephen",
    last_name: "McLoughlin",
    email: "kevinmcloughlin2010+stephen@gmail.com",
    phone_number: 6474536911,
    healthcard_number: "5584486674SM",
    gender: "male",
    date_of_birth: Date.new(1990,8,1),
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  },
  {
    first_name: "Stephanie",
    last_name: "McLoughlin",
    email: "kevinmcloughlin2010+stephanie@gmail.com",
    phone_number: 6478811313,
    healthcard_number: "7784486674SM",
    gender: "female",
    date_of_birth: Date.new(1992,10,27),
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  },
  {
    first_name: "Michael",
    last_name: "McLoughlin",
    email: "kevinmcloughlin2010+dad@gmail.com",
    phone_number: 4168457811,
    healthcard_number: "7784486674MM",
    gender: "male",
    date_of_birth: Date.new(1955,12,14),
    city: "Toronto",
    country: "Canada",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  }
]

# Create each patient in the list
patient_list.each do |patient|
  Patient.create(patient)
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
  },
  {
    allergies: "None",
    medications: "None",
    surgeries: "None",
    existing_conditions: "None"
  }
]

# Create each health record on the list
health_record_list.each do |record|
  HealthRecord.create(record)
end

# Associate each record with its corresponding patient
record1 = HealthRecord.first
record1.patient = Patient.first
record1.save
Patient.first.save

record2 = HealthRecord.second
record2.patient = Patient.second
record2.save
Patient.second.save

record3 = HealthRecord.third
record3.patient = Patient.third
record3.save
Patient.third.save

record4 = HealthRecord.fourth
record4.patient = Patient.fourth
record4.save
Patient.fourth.save

# Provide list of initial relationships
relationship_list = [
  {
    doctor_id: 1,
    patient_id: 1,
    inviter: "patient",
    status: "accepted"
  },
  {
    doctor_id: 1,
    patient_id: 2,
    inviter: "patient",
    status: "accepted"
  },
  {
    doctor_id: 1,
    patient_id: 3,
    inviter: "patient",
    status: "accepted"
  },
  {
    doctor_id: 4,
    patient_id: 1,
    inviter: "patient",
    status: "accepted"
  },
  {
    doctor_id: 2,
    patient_id: 2,
    inviter: "doctor",
    status: "accepted"
  },
  {
    doctor_id: 2,
    patient_id: 1,
    inviter: "doctor",
    status: "accepted"
  },
  {
    doctor_id: 3,
    patient_id: 3,
    inviter: "doctor",
    status: "pending"
  },
  {
    doctor_id: 3,
    patient_id: 4,
    inviter: "patient",
    status: "pending"
  }
]

# Create each relationship on the list
relationship_list.each do |relationship|
  Relationship.create(relationship)
end
