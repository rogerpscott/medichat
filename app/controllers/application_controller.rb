class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    if resource.class == Doctor
      doctor_conversations_path
    elsif resource.class == Patient
      root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource.class == Doctor
      doctor_make_unavailable_path
    else
      root_path
    end
  end

  def log_out_well
    if current_user.class == Doctor
      @doctor_profile = DoctorProfile.find_by(doctor: current_user)
      @doctor_profile.available = false
      @doctor_profile.save
    end
    sign_out(current_user)
    redirect_to root_path
  end
end
