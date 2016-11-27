class PatientProfile < ApplicationRecord
  BLOODTYPES = %w(O+ O- A+ A- B+ B- AB+ AB-)
  SEX = %w(Masculino Femenino)
  belongs_to :patient
  validates :blood_type, inclusion: { in: BLOODTYPES,
    message: "%{value} no es un tipo de sangre valido" }, allow_nil: true
  validates :sex, inclusion: { in: SEX,
    message: "%{value} no es un sexo valido" }, allow_nil: true
end
