# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p1 = Patient.create(email: "patient1@gmail.com", password:"123456")
p2 = Patient.create(email: "patient2@gmail.com", password:"123456")
p3 = Patient.create(email: "patient3@gmail.com", password:"123456")
d1 = Doctor.create(email: "doctor1@gmail.com", password:"123456")
d2 = Doctor.create(email: "doctor2@gmail.com", password:"123456")
d3 = Doctor.create(email: "doctor3@gmail.com", password:"123456")

dp1 = DoctorProfile.create(doctor: d1, available: false, last_name: "Uno", cmp: "029397")
dp2 = DoctorProfile.create(doctor: d2, available: false, last_name: "Dos", cmp: "029398")
dp3 = DoctorProfile.create(doctor: d3, available: false, last_name: "Tres", cmp: "029399")

pp1 = PatientProfile.create(patient: p1, first_name: "Paciente 1", last_name:"McBobby", dni: "123456789", phone: "5534274364", sex:"Masculino", birthday: "1980-12-12", blood_type: "O+", existing_conditions: "Siempre me ha dolido mucho la espalda", allergies: "nueces", height: "170", weight: "65")
pp2 = PatientProfile.create(patient: p2, first_name: "Paciente 2", last_name:"McJohnson", dni: "123456789", phone: "5534274364", sex:"Masculino", birthday: "1980-12-12", blood_type: "A-", existing_conditions: "Fumo bastante y tengo problemas de asma", allergies: "leche y polen", height: "170", weight: "65")
pp3 = PatientProfile.create(patient: p3, first_name: "Paciente 3", last_name:"McJohnson", dni: "123456789", phone: "5534274364", sex:"Femenino", birthday: "1980-12-12", blood_type: "A+", existing_conditions: "ninguna", allergies: "ninguna", height: "170", weight: "65")
