class Doctor::DoctorProfilesController < ApplicationController
  def make_available
    @doctor_profile = DoctorProfile.find_by(doctor: current_user)
    @doctor_profile.available = true
    @doctor_profile.save
    redirect_to doctor_conversations_path
  end

  def make_unavailable
    @doctor_profile = DoctorProfile.find_by(doctor: current_user)
    @doctor_profile.available = false
    @doctor_profile.save
    redirect_to request.referrer
  end
end
