class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end

class Patient < User
  has_many :conversations
  has_one :patient_profile
end

class Doctor < User
  has_many :conversations
  has_one :doctor_profile
end

