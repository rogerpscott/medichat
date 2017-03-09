class Doctor < User
  has_many :conversations
  has_one :doctor_profile
end
